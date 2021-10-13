
#define SKYBOX_MAX_BOUND 736
#define ceil(x) (-round(-(x)))

/obj/skybox
	name = "skybox"
	mouse_opacity = 0
	anchored = TRUE
	simulated = FALSE
	plane = SKYBOX_PLANE
	blend_mode = BLEND_MULTIPLY
	var/base_x_dim = 7
	var/base_y_dim = 7
	var/base_offset_x = -224 // -(world.view x dimension * world.icon_size)
	var/base_offset_y = -224 // -(world.view y dimension * world.icon_size)

/obj/skybox/Initialize()
	screen_loc = "CENTER:[base_offset_x],CENTER:[base_offset_y]"
	. = ..()

/client
	var/obj/skybox/skybox
	var/last_view_x_dim = 7
	var/last_view_y_dim = 7

	verb/SetWindowIconSize(var/val as num|text)
		set hidden = 1
		winset(src, "mapwindow.map", "icon-size=[val]")
		if(prefs && val != prefs.icon_size)
			prefs.icon_size = val
			SScharacter_setup.queue_preferences_save(prefs)
		OnResize()
	verb/OnResize()
		set hidden = 1

		var/divisor = text2num(winget(src, "mapwindow.map", "icon-size")) || world.icon_size
		if(!isnull(config.lock_client_view_x) && !isnull(config.lock_client_view_y))
			last_view_x_dim = config.lock_client_view_x
			last_view_y_dim = config.lock_client_view_y
		else
			var/winsize_string = winget(src, "mapwindow.map", "size")
			last_view_x_dim = config.lock_client_view_x || clamp(ceil(text2num(winsize_string) / divisor), 15, config.max_client_view_x || 41)
			last_view_y_dim = config.lock_client_view_y || clamp(ceil(text2num(copytext(winsize_string,findtext(winsize_string,"x")+1,0)) / divisor), 15, config.max_client_view_y || 41)
			if(last_view_x_dim % 2 == 0) last_view_x_dim++
			if(last_view_y_dim % 2 == 0) last_view_y_dim++
		for(var/check_icon_size in global.valid_icon_sizes)
			winset(src, "menu.icon[check_icon_size]", "is-checked=false")
		winset(src, "menu.icon[divisor]", "is-checked=true")

		view = "[last_view_x_dim]x[last_view_y_dim]"

		// Reset eye/perspective
		var/last_perspective = perspective
		perspective = MOB_PERSPECTIVE
		if(perspective != last_perspective)
			perspective = last_perspective
		var/last_eye = eye
		eye = mob
		if(eye != last_eye)
			eye = last_eye

		// Recenter skybox and lighting.
		set_skybox_offsets(last_view_x_dim, last_view_y_dim)
		if(mob)
			mob.reload_fullscreen()
	verb/force_onresize_view_update()
		set name = "Force Client View Update"
		set src = usr
		set category = "Debug"
		OnResize()

	verb/show_winset_debug_values()
		set name = "Show Client View Debug Values"
		set src = usr
		set category = "Debug"

		var/divisor = text2num(winget(src, "mapwindow.map", "icon-size")) || world.icon_size
		var/winsize_string = winget(src, "mapwindow.map", "size")

		to_chat(usr, "Current client view: [view]")
		to_chat(usr, "Icon size: [divisor]")
		to_chat(usr, "xDim: [round(text2num(winsize_string) / divisor)]")
		to_chat(usr, "yDim: [round(text2num(copytext(winsize_string,findtext(winsize_string,"x")+1,0)) / divisor)]")
	proc/set_skybox_offsets(var/x_dim, var/y_dim)
		if(!skybox)
			update_skybox()
		if(skybox)
			skybox.base_x_dim = x_dim
			skybox.base_y_dim = y_dim
			skybox.base_offset_x = -((world.icon_size * skybox.base_x_dim)/2)
			skybox.base_offset_y = -((world.icon_size * skybox.base_y_dim)/2)

			// Check if the skybox needs to be scaled to fit large displays.
			var/new_max_tile_bound = max(skybox.base_x_dim, skybox.base_y_dim)
			var/old_max_tile_bound = 736/world.icon_size
			if(new_max_tile_bound > old_max_tile_bound)
				var/matrix/M = matrix()
				M.Scale(1 + (new_max_tile_bound/old_max_tile_bound))
				skybox.transform = M
			else
				skybox.transform = null
			update_skybox()

	proc/update_skybox(rebuild)
		if(!skybox)
			skybox = new()
			screen += skybox
			rebuild = 1
		var/turf/T = get_turf(eye)
		if(T)
			if(rebuild)
				skybox.overlays.Cut()
				skybox.overlays += SSskybox.get_skybox(T.z)
				screen |= skybox
			skybox.screen_loc = "CENTER:[skybox.base_offset_x - T.x],CENTER:[skybox.base_offset_y - T.y]"

/mob/Move()
	var/old_z = get_z(src)
	. = ..()
	if(. && client)
		client.update_skybox(old_z != get_z(src))

/mob/forceMove()
	var/old_z = get_z(src)
	. = ..()
	if(. && client)
		client.update_skybox(old_z != get_z(src))

#undef SKYBOX_MAX_BOUND