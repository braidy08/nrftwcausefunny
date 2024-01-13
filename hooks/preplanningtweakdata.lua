Hooks:PostHook(PrePlanningTweakData,"init","init_nrftwcausefunny_lev",function(self)

	self:_create_locations(tweak_data)

	self.types.nrftw_vanstayinloud = {
		name_id = "menu_nrftw_vanstayinloud_name",
		desc_id = "menu_nrftw_vanstayinloud_desc",
		plan = "escape_plan",
		pos_not_important = false,
		category = "escape_plan",
		post_event = "preplan_17",
		prio = 1,
		icon = 23,
		total = 1,
		cost = 10000,
		budget_cost = 8
	}
	self.types.nrftw_vannormal = {
		name_id = "menu_nrftw_vannormal_name",
		desc_id = "menu_nrftw_vannormal_desc",
		plan = "escape_plan",
		pos_not_important = false,
		category = "escape_plan",
		post_event = "preplan_17",
		prio = 1,
		icon = 23,
		total = 1,
		cost = 0,
		budget_cost = 0
	}
	
	
end)

Hooks:PostHook(PrePlanningTweakData,"_create_locations","_create_locations_nrftwcausefunny_lev",function(self)

	self.locations.nrftwcausefunny_lev = {
		{
			texture = "textures/preplanningtemplmao",
			name_id = "menu_pp_berry_bpr_loc_a",
			rotation = 0,
			map_size = 1,
			map_x = 0,
			map_y = 0,
			x1 = 2770,
			y1 = 3120,
			x2 = 370,
			y2 = 720,
			custom_points = {}
		},
		mission_briefing_texture = "textures/preplanningtemplmao",
		total_budget = 10,
		default_plans = {
				escape_plan = "nrftw_vannormal"
		},
		start_location = {
			group = "a",
			zoom = 1,
			x = 1024,
			y = 1024
		}
	}
end)