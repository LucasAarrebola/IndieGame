if other.perm_hit == true {
	switch (obj_menu.grid_items[# Infos_Inv.Sprite, 0]){
		//Caso Item equipado seja Demon
		#region Itens Demon
			case spr_itens_demon:
				other.vida -= oPlayer.dano[oPlayer.level] + obj_menu.grid_items[# Infos_Inv.Quantidade, 0] + 2;

				var _dir = point_direction(oPlayer.x, oPlayer.y, other.x, other.y);
	 			other.empurrar_dir = _dir;
				other.empurrar_veloc = 6;
				other.state = scr_slime_hit;

				other.alarm[1] = 6;
				other.hit = true;

				var _inst = instance_create_layer(x, y, "Instances", obj_dano_slime);
				_inst.alvo = other;
				_inst.dano = oPlayer.dano[oPlayer.level] + obj_menu.grid_items[# Infos_Inv.Quantidade, 0] + 2; 

				obj_screenshake.valor = 5;  
			break;
		#endregion
		//Caso Item equipado seja Padrão
		#region itens Padrões
			case spr_itens:
				other.vida -= oPlayer.dano[oPlayer.level] + obj_menu.grid_items[# Infos_Inv.Quantidade, 0];

				var _dir = point_direction(oPlayer.x, oPlayer.y, other.x, other.y);
				other.empurrar_dir = _dir;
				other.empurrar_veloc = 6;
				other.state = scr_slime_hit;

				other.alarm[1] = 6;
				other.hit = true;

				var _inst = instance_create_layer(x, y, "Instances", obj_dano_slime);
				_inst.alvo = other;
				_inst.dano = oPlayer.dano[oPlayer.level] + obj_menu.grid_items[# Infos_Inv.Quantidade, 0]; 

				obj_screenshake.valor = 5;  
			break;
		#endregion
	}
}