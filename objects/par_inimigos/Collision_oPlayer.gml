 /// @description Ataque
if other.tomardano == true {
	var _dir = point_direction(x, y, other.x, other.y);
	obj_screenshake.valor = 5;
with (other){
	empurrar_dir = _dir;
	state = scr_pers_hit;
	alarm[2] = 10;
	alarm[3] = 180;
	tomardano = false;
	vida -= 1;
	}
	var _inst = instance_create_layer(x, y, "Instances", obj_dano_player);
	_inst.alvo = other;
	_inst.dano = 1;
}

