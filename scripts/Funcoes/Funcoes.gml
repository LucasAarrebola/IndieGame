function fim_da_animacao(){
	var _sprite = sprite_index;
	var _image = image_index;
	if(argument_count > 0) _sprite = argument[0];
	if(argument_count > 1) _image = argument[1];
	var _type = sprite_get_speed_type(sprite_index);
	var _spd = sprite_get_speed(sprite_index)*image_index;
	if(_type = spritespeed_framespersecond)
		_spd = _spd/room_speed;
	if(argument_count > 2) _spd = argument[2];
	return _image + _spd >= sprite_get_number(_sprite);
}

function text_outline(){
	var dto_dcol = draw_get_color();
	
	draw_set_color(argument4);
	
	for(var dto_i=45; dto_i<405; dto_i+=360/argument5)
	{
		draw_text_ext(argument0+round(lengthdir_x(argument3,dto_i)),argument1+round(lengthdir_y(argument3,dto_i)),argument2,argument6,argument7);
	}
	
	draw_set_color(dto_dcol);
	
	draw_text_ext(argument0,argument1,argument2,argument6,argument7);
}
	
function grid_add_item(){
	var _grid = obj_menu.grid_items;
	var _checagem = 0;
	
	while _grid[# Infos_Inv.Item, _checagem] != -1{
		_checagem++;
	}
	_grid[# 0, _checagem] = argument[0];
	_grid[# 1, _checagem] = argument[1];
	_grid[# 2, _checagem] = argument[2];
}

function scr_txt(){
	switch npc_nome{
		case "Lobo Da Caverna":
			ds_grid_add_text("Ei Viajante, como veio parar aqui??", spr_retrato_npc_lobo, 0, npc_nome);
			ds_grid_add_text("Como você sabe que eu sou um Viajante?? Quem é você??", spr_retrato_perso , 1, "Viajante");
			ds_grid_add_text("Perdao minha indelicadeza haha!! Sou apenas um lobo perdido em busca da saida.", spr_retrato_npc_lobo, 0, npc_nome);
			ds_grid_add_text("Vejo que é um Viajante pela roupa que esta usando, ele esta revirada, suja enfim haha, boa exploração para o senhor!! ", spr_retrato_npc_lobo, 0, npc_nome);
		break;
		case "Pai Sapo":
			ds_grid_add_text("Bom dia Stark! Tudo bem com você?", spr_retrato_npc_pai_sapo, 0, npc_nome);
			ds_grid_add_text("Olá Sr.Sapo, Estou otimo!!", spr_retrato_perso , 1, "Viajante");
			ds_grid_add_text("Que bom meu filho!", spr_retrato_npc_pai_sapo, 0, npc_nome);
		break;
	}
}

function ds_grid_add_row(){ 
	var _grid = argument[0];
	ds_grid_resize(_grid, ds_grid_width(_grid), ds_grid_height(_grid) + 1);
	return(ds_grid_height(_grid) - 1);
}

function ds_grid_add_text(){
	var _grid = text_grid; 
	var _y = ds_grid_add_row(_grid);
	
	_grid[# 0, _y] = argument[0];
	_grid[# 1, _y] = argument[1];
	_grid[# 2, _y] = argument[2];
	_grid[# 3, _y] = argument[3];
}