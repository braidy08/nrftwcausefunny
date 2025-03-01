--[[
going to make this cause the normal timer element doesnt do things i want like
- changing timer speed (the thermite in pd3 does this to my knowledge)
- thats about it
]]

core:import("CoreMissionScriptElement")

NRFTWTimerElement = NRFTWTimerElement or class(CoreMissionScriptElement.MissionScriptElement)
NRFTWTimerElement.timer = 0 -- this is in seconds
NRFTWTimerElement.countdownspeed = 1 -- this is a value between 0-1

function NRFTWTimerElement:init(...)
    NRFTWTimerElement.super.init(self, ...)
end

function NRFTWTimerElement:client_on_executed(...)
end

function NRFTWTimerElement:on_executed(instigator, ...)
	if not self._values.enabled then
		return
	end

	NRFTWTimerElement.super.on_executed(self, instigator)
end

function NRFTWTimerElement:add_updator()
	if not Network:is_server() then
		return
	end

	if not self._updator then
		self._updator = true

		self._mission_script:add_updator(self._id, callback(self, self, "update_timer"))
	end
end

function NRFTWTimerElement:remove_updator()
	if self._updator then
		self._mission_script:remove_updator(self._id)

		self._updator = nil
	end
end

function NRFTWTimerElement:timer_operation_pause()
	self:remove_updator()
end

function NRFTWTimerElement:timer_operation_start()
	self:add_updator()
end

function NRFTWTimerElement:update_timer(t, dt)
    local Tspeed = self._values.countdownspeed
	self._values.timer = self._values.timer - (dt * Tspeed)

	if self._values.timer <= 0 then
		self:remove_updator()
		self:on_executed()
	end
end


function NRFTWTimerElement:SetTimer(operation,time,speed)
    if operation == "set_time" then
        local currenttime = self._values.timer
        if currenttime ~= time then
            self._values.timer = time
        end
    elseif operation == "set_speed" then
        local currentspeed = self._values.countdownspeed
        if currentspeed ~= speed then
            self._values.countdownspeed = speed
        end
    end
end

NRFTWTimerOperatorElement = NRFTWTimerOperatorElement or class(CoreMissionScriptElement.MissionScriptElement)
NRFTWTimerOperatorElement.operation = "none"
NRFTWTimerOperatorElement.time = 0
NRFTWTimerOperatorElement.elements = {}
NRFTWTimerOperatorElement.countdownspeed = 1

function NRFTWTimerOperatorElement:init(...)
	NRFTWTimerOperatorElement.super.init(self, ...)
end

function NRFTWTimerOperatorElement:client_on_executed(...)
end

function NRFTWTimerOperatorElement:on_executed(instigator, ...)
	if not self._values.enabled then return end

	for _, id in ipairs(self._values.elements) do
		local element = self:get_mission_element(id)

		if element then
			if self._values.operation == "pause" then
				element:timer_operation_pause()
			elseif self._values.operation == "start" then
				element:timer_operation_start()
			elseif self._values.operation == "set_time" then
				element:SetTimer(self._values.operation,self._values.time,nil)
			elseif self._values.operation == "set_speed" then
				element:SetTimer(self._values.operation,nil,self._values.countdownspeed)
			end
		end
	end
    NRFTWTimerOperatorElement.super.on_executed(self, instigator, ...)
end

if BLE then
    Hooks:Add("BeardLibPostInit", "NRFTWTimerElementEditor", function(self)
        NRFTWTimerEditor = NRFTWTimerEditor or class(MissionScriptEditor)

        function NRFTWTimerEditor:create_element()
            self.super.create_element(self)
            self._element.class = "NRFTWTimerElement"
            self._element.values.timer = 0
            self._element.values.countdownspeed = 1
        end

        function NRFTWTimerEditor:_build_panel()
            self:_create_panel()
            self:NumberCtrl("timer", {floats = 1, min = 0, help = "blah blah blah"})
        end
        NRFTWTimerOperatorEditor = NRFTWTimerOperatorEditor or class(MissionScriptEditor)
        NRFTWTimerOperatorEditor.ELEMENT_FILTER = {"NRFTWTimerElement"}
        function NRFTWTimerOperatorEditor:create_element()
            self.super.create_element(self)
            self._element.class = "NRFTWTimerOperatorElement"
            self._element.values.operation = "none"
            self._element.values.time = 0
            self._element.values.countdownspeed = 1
            self._element.values.elements = {}
        end

        function NRFTWTimerOperatorEditor:_build_panel()
            self:_create_panel()
            self:BuildElementsManage("elements", nil, self.ELEMENT_FILTER)
            self:ComboCtrl("operation", {"none","pause","start","set_time","set_speed"}, {help = "Select an operation for the selected elements"})
            self:NumberCtrl("time", {floats = 1, min = 0, help = "blah blah blah"})
            self:NumberCtrl("countdownspeed", {floats = 2, min = 0, help = "set the countdownspeed"})
        end
        table.insert(BLE._config.MissionElements, "NRFTWTimerElement")
        table.insert(BLE._config.MissionElements, "NRFTWTimerOperatorElement")
    end)
end