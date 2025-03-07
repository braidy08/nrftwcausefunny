Hooks:PostHook(MusicManager, "jukebox_default_tracks", "nrftwcausefunny_track", function(self)
	local track = Hooks:GetReturn()
	track.heist_nrftwcausefunny_nar_name = "track_21"
	return track
end)