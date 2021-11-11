/datum/map/torch
	name = "\improper Andromeda"
	full_name = "\improper SFV Andromeda"
	path = "torch"
	flags = MAP_HAS_BRANCH | MAP_HAS_RANK
	config_path = "config/torch_config.txt"

	admin_levels  = list(7)
	escape_levels = list(8)
	empty_levels  = list(9)
	accessible_z_levels = list("1"=1,"2"=3,"3"=1,"4"=1,"5"=1,"6"=1,"9"=30)
	overmap_size = 35
	overmap_event_areas = 34
	usable_email_tlds = list("andromeda.scgf.mil", "andromeda.scgmc.mil", "freemail.net", "andromeda.nt")

	allowed_spawns = list("Cryogenic Storage", "Cyborg Storage")
	default_spawn = "Cryogenic Storage"

	station_name  = "\improper SFV Andromeda"
	station_short = "\improper Andromeda"
	dock_name     = "TBD"
	boss_name     = "Mars Fleet Command"
	boss_short    = "Command"
	company_name  = "Sol Central Government"
	company_short = "SCG"

	map_admin_faxes = list(
		"SCG Fleet Mars Command",
		"SCG Fleet Luna Strategic Command",
		"NT Surveyor Corps Relay",
		"SCG Secretariat",
		"SCC Corporate Relay",
		"SFP Territory Support",
		"SFP Special Investigations",
		"SFP Fugitive Recovery",
		"SCG Bureau of Diplomatic Affairs",
		"SCG Emergency Management Bureau",
		"Cuchulain Foundation Secure Relay",
		"Secure Routing Service"
	)

	//These should probably be moved into the evac controller...
	shuttle_docked_message = "Attention all personnel: Jump preparation complete. The bluespace drive is now spooling up, secure all stations for departure. Time to jump: approximately %ETD%."
	shuttle_leaving_dock = "Attention all personnel: Jump initiated, exiting bluespace in %ETA%."
	shuttle_called_message = "Attention all personnel: Jump sequence initiated. Transit procedures are now in effect. Jump in %ETA%."
	shuttle_recall_message = "Attention all personnel: Jump sequence aborted, return to normal operating conditions."

	evac_controller_type = /datum/evacuation_controller/starship

	default_law_type = /datum/ai_laws/solgov
	use_overmap = 1

    // These are the default, and are overriden by the config if uncommented.
	num_exoplanets = 3
	away_site_budget = 7
	id_hud_icons = 'maps/torch/icons/assignment_hud.dmi'
