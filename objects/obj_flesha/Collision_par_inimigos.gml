instance_destroy();
switch (obj_menu.grid_items[# Infos_Inv.Sprite, 0]){
	#region Itens Demon
		case spr_itens_demon:
			var _dir = point_direction(x, y, other.x, other.y);
			other.empurrar_dir = _dir;
			other.empurrar_veloc = 6;
			other.hit = true;
			other.state = scr_slime_hit;
			other.alarm[1] = 6;
			other.vida -= oPlayer.dano[oPlayer.level] + obj_menu.grid_items[# Infos_Inv.Quantidade, 0] + 2;

			var _inst = instance_create_layer(x, y, "Instances", obj_dano_slime);
			_inst.alvo = other;
			_inst.dano = oPlayer.dano[oPlayer.level] + obj_menu.grid_items[# Infos_Inv.Quantidade, 0] + 2; 

			obj_screenshake.valor = 5;
		break;
	#endregion
	#region Itens Padrões
			case spr_itens:
				var _dir = point_direction(x, y, other.x, other.y);
				other.empurrar_dir = _dir;
				other.empurrar_veloc = 6;
				other.hit = true;
				other.state = scr_slime_hit;
				other.alarm[1] = 6;
				other.vida -= oPlayer.dano[oPlayer.level] + obj_menu.grid_items[# Infos_Inv.Quantidade, 0];

				var _inst = instance_create_layer(x, y, "Instances", obj_dano_slime);
				_inst.alvo = other;
				_inst.dano = oPlayer.dano[oPlayer.level] + obj_menu.grid_items[# Infos_Inv.Quantidade, 0]; 

				obj_screenshake.valor = 5;
			break;
	#endregion
}