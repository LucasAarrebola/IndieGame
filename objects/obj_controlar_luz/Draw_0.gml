if (!surface_exists(surfa)){
	surfa = surface_create(room_width, room_height);
}else{
	surface_set_target(surfa);
	draw_clear_alpha(c_black, .85);
		gpu_set_blendmode(bm_subtract);
	
	with(obj_luz){
		var _luzt = random_range(.01, .02);
		
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale + _luzt, image_yscale + _luzt, image_angle, c_white, 1);
	}
	
	with(oPlayer){
		var _luzt = random_range(.01, .02);
		var _luzm = random_range(-.1, .1);
		
		draw_sprite_ext(spr_luz, 0, x + _luzm, y + _luzm, 1.5 + _luzt, 1.5 + _luzt, 0, c_white, 1);
	}
	with(par_inimigos){
		var _luzt = random_range(.01, .02);
		var _luzm = random_range(-.1, .1);
		
		draw_sprite_ext(spr_luz, 0, x + _luzm, y + _luzm, 0.75 + _luzt, 0.75 + _luzt, 0, c_white, 1);
	}
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target();
	draw_surface(surfa, 0, 0);
}