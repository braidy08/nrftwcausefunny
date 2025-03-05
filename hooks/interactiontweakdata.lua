Hooks:PostHook(InteractionTweakData, "init", "init_nrftwdyepack", function(self, tweak_data)
    self.disabledyepack = {
        text_id = "hud_int_hold_disable_dyepack",
		action_text_id = "hud_action_disabling_dyepack",
		timer = 1.2,
    }
	-- lucky i checked the timer to make sure it is actually possible solo (i should probably just check how long it is in pd3)
	    self.pickupdyedmoney = {
        text_id = "hud_int_hold_pickup_dyedmoney",
		action_text_id = "hud_action_taking_dyedmoney",
		timer = 3,
		blocked_hint = "carry_block",
		sound_start = "bar_bag_money",
		sound_interupt = "bar_bag_money_cancel",
		sound_done = "bar_bag_money_finished",
    }
    
end)