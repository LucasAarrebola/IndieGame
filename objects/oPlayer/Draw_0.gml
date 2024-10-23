/// @description Sombra
draw_sprite(sSombra, 0, x, y + 4);
draw_self();

if alarm[3] > 0{
	if image_alpha >= 1{
		dano_alfa = -0.15;
	}else if image_alpha <= 0{
		dano_alfa = 0.15;
	}	
	image_alpha += dano_alfa;
}else{
	image_alpha = 1;
}

if distance_to_object(obj_par_npcs) <= 10{
	fontPixel = font_add_sprite_ext(spr_fontnumber, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ()", true, 0);
	draw_set_font(fontPixel);
	draw_text_ext_transformed_color(obj_par_npcs.x - 4, obj_par_npcs.y - 22, "C", 50, 500, .5, .5, 0, c_white, c_white, c_white, c_white, 1);
}