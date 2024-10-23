if inicializar == true{
	var _guil = display_get_gui_width();
	var _guia = display_get_gui_height();

	var _xx = 0;
	var _yy = _guia - 200;
	var _c = c_black;
	var _spr = text_grid[# Dialogos.Retrato, pagina]
	draw_set_font(fnt_dialogo);

	//Lado Esquerdo
	if text_grid[# Dialogos.Lado, pagina] == 0 {
		draw_rectangle_color(_xx + 200, _yy, _guil, _guia, _c, _c, _c, _c, false);
		draw_text(_xx + 216, _yy - 32, text_grid[# Dialogos.Nome, pagina]);
		draw_text_ext(_xx + 232, _yy + 32, text_grid[# Dialogos.Texto, pagina], 32, _guia - 264);
	
		draw_sprite_ext(_spr, 0, 100, _guia - 12, 12, 12, 0, c_white, 1);
	}//Lado Direito
	else{
		draw_rectangle_color(_xx, _yy, _guil - 200, _guia, _c, _c, _c, _c, false);
		var _stgw = string_width(text_grid[# Dialogos.Nome, pagina]);
		draw_text(_xx + 16, _yy - 32, text_grid[# Dialogos.Nome, pagina]);
		draw_text_ext(_xx + 32, _yy + 32, text_grid[# Dialogos.Texto, pagina], 32, _guia - 264);
	
		draw_sprite_ext(_spr, 0, _guil - 100, _guia - 12, -12, 12, 0, c_white, 1);
	}
}