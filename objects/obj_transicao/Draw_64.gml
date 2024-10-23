for (var i = 0; i < lins; i++){
	for (var j = 0; j < cols; j++){
		var _img  = min(max(0, img - j), img_num);
		
		draw_sprite_ext(spr_quad, _img, j * tamanho, i * tamanho, 1, 1, 0, c_black, 1);
	}
}
fontPixel = font_add_sprite_ext(spr_fontnumber, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ()", true, 0);