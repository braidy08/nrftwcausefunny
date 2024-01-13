Hooks:PostHook(CarryTweakData, "init", "init_nrftwdyedmoney", function(self, tweak_data)

	self.dyedmoney = {
		type = "medium",
		name_id = "hud_carry_dyedmoney",
		bag_value = "diamonds",
		unit = "units/payday2/pickups/gen_pku_toolbag_large/gen_pku_toolbag_large",
		visual_unit_name = "units/payday2/characters/npc_acc_tools_bag_large_1/npc_acc_tools_bag_large_1",
		dye = true,
		AI_carry = {
				SO_category = "enemies"
		}
	}
end)

