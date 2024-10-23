 if global.dialogo == false{
	#region Move
	script_execute(state);
	global.arma = obj_menu.grid_items[# Infos_Inv.Item, 0];
	#endregion
	#region status
	if alarm[1] <= 0{
		estamina += 1;
	}

	estamina = clamp(estamina, 0, max_estamina[level]);

	if level == 10{
			par_inimigos.xp_morte = 0;
	}else{
		if xp >= max_xp[level]{
			xp = xp - max_xp[level];
			level += 1;
		}
	}
	
	if vida <= 0{
		state = scr_perso_morte;
	}
	#endregion
}

#region drop
	if instance_exists(obj_item){
		var _inst = instance_nearest(x, y, obj_item);
		if distance_to_point(_inst.x, _inst.y) <= 20{
			if keyboard_check_pressed(ord("C")){
				grid_add_item(_inst.image_index, _inst.quantidade, _inst.sprite_index);
				instance_destroy(_inst);
			}
		}
	}
	#endregion

#region dialogo
if distance_to_object(obj_par_npcs) <= 10{
	fontPixel = font_add_sprite_ext(spr_fontnumber, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ()", true, 0);
	draw_text(obj_par_npcs.x, obj_par_npcs.y - 20, "C");
	if keyboard_check_pressed(ord("C")) and global.dialogo == false{
		var _npc = instance_nearest(x, y, obj_par_npcs);
		var _dialogo = instance_create_layer(x, y, "Dialogos", obj_dialogo);
		_dialogo.npc_nome = _npc.nome;
	}
}
#endregion

depth = -y;

