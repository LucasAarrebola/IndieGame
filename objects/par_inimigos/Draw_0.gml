 if hit = true{
	gpu_set_fog(true, c_white, 0, 0);
	if vida >= 1 {
		draw_sprite(sombra, image_index, x, y + 2);
	}
	draw_self();
	gpu_set_fog(false, c_white, 0, 0);
}else{
	if vida >= 1 {
		draw_sprite(sombra, image_index, x, y + 2);
	}
	draw_self();
}

if dest_x < x{
	image_xscale = -1;
}else{
	image_xscale = 1;
}

if vida >= 1 {
	if alarm[2] >= 0 {
		var _sprw = sprite_get_width(spr_inimigo_hud_vida);
		draw_sprite_ext(spr_inimigo_hud_vida, 0 , x - _sprw/2, y - 8, 1, 1, 0, c_white, 1);
		draw_sprite_ext(spr_inimigo_barra_vida, 0, x - _sprw/2, y - 8, vida/max_vida, 1, 0 , c_white, 1);
	}
}