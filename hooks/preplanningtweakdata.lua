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
	self.types.nrftw_specialescape = {
		name_id = "menu_nrftw_specialescape_name",
		desc_id = "menu_nrftw_specialescape_desc",
		plan = "escape_plan",
		pos_not_important = false,
		category = "escape_plan",
		post_event = "preplan_17",
		prio = 1,
		icon = 103,
		total = 1,
		cost = 20000,
		budget_cost = 10
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
	self.types.nrftw_morethermite = {
		name_id = "menu_nrftw_morethermite_name",
		desc_id = "menu_nrftw_morethermite_desc",
		category = "mission_equipment",
		post_event = "preplan_02",
		prio = 1,
		icon = 51,
		total = 1,
		cost = 1000,
		budget_cost = 1
	}
	self.types.nrftw_thermiteentrance = {
		name_id = "menu_nrftw_thermiteentrance_name",
		desc_id = "menu_nrftw_thermiteentrance_desc",
		plan = "vault_plan",
		pos_not_important = false,
		category = "vault_plan",
		post_event = "preplan_02",
		prio = 1,
		icon = 51,
		total = 1,
		cost = 0,
		budget_cost = 0
	}
	self.types.nrftw_vaultlockdownsabotage = {
		name_id = "menu_nrftw_vaultlockdownsabotage_name",
		desc_id = "menu_nrftw_vaultlockdownsabotage_desc",
		plan = "vault_plan",
		pos_not_important = false,
		category = "vault_plan",
		post_event = "preplan_02",
		prio = 1,
		icon = 42,
		total = 1,
		cost = 5000,
		budget_cost = 6
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
		total_budget = 12,
		default_plans = {
				escape_plan = "nrftw_vannormal",
				vault_plan = "nrftw_thermiteentrance"
		},
		start_location = {
			group = "a",
			zoom = 1,
			x = 1024,
			y = 1024
		}
	}
end)