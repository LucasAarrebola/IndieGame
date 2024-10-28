function scr_slime_colis(){
	
	if place_meeting(x + hveloc, y, obj_parede){
		while !place_meeting(x + sign(hveloc), y, obj_parede){
			x += sign(hveloc);
		}
		hveloc = 0;
	}

	x += hveloc;

	if place_meeting(x, y + vveloc, obj_parede){
		while !place_meeting(x, y + sign(vveloc), obj_parede){
			y += sign(vveloc);
		}
		vveloc = 0;
	}

	y += vveloc;
	
		
	if image_index >= 18 {
		instance_create_layer(x, y, "Instances", obj_hit_inimigo);
		perm_hit = true;
	}
}

function scr_slime_check(){
	if distance_to_object(oPlayer) <= dist_agress{
		state = scr_slime_perseg;
	}
}

function scr_slime_escolher_state(){
	scr_slime_check();
	
	perm_hit = true;

	if inimigo = "slime" {
		if fim_da_animacao(){
			sprite_index = spr_slime_pequeno;
		}	
	}

	prox_state = choose(scr_slime_andando, scr_slime_parado);
	
	if prox_state == scr_slime_andando{
		state = scr_slime_andando;
		dest_x = irandom_range(0, room_width);
		dest_y = irandom_range(0, room_height);
	}else if prox_state == scr_slime_parado{
		state = scr_slime_parado;	
	}
} 

function scr_slime_andando(){
	image_speed = 1;
	if inimigo = "slime" {
		if fim_da_animacao(){
			sprite_index = spr_slime_pequeno;
		}
	}
	
	scr_slime_check();
	
	var _dir = point_direction(x, y, dest_x, dest_y);
	hveloc = lengthdir_x(veloc, _dir);
	vveloc = lengthdir_y(veloc, _dir);
	
	scr_slime_colis();
}

function scr_slime_parado(){
	if inimigo = "slime" {
		if fim_da_animacao(){
			sprite_index = spr_slime_pequeno;
		}	
	}
	scr_slime_check();
	scr_slime_colis();
	image_speed = .5;	
}

function scr_slime_perseg(){
	if inimigo = "slime" {
		image_speed = 1.5;
	
		scr_slime_colis();
		
		if fim_da_animacao(){
			sprite_index = spr_slime_pequeno;
		}	
		
		dest_x = oPlayer.x;
		dest_y = oPlayer.y;
		
		var _dist = point_distance(x, y, dest_x, dest_y)
		var _dir = point_direction(x, y, dest_x, dest_y);
		hveloc = lengthdir_x(veloc_perseg, _dir);
		vveloc = lengthdir_y(veloc_perseg, _dir);
		
		if _dist <= 20{
			state = scr_slime_atack;
		}
		
		if distance_to_object(oPlayer) >= dist_desagress{
			state = scr_slime_escolher_state;
			alarm[0] = irandom_range(120, 240);
		}
	}
	
	if inimigo = "golem" {
		if alarm[2] <= 0 {
			dash_dir = point_direction(x, y, oPlayer.x,oPlayer.y); 
			alarm[2] = 180;
			alarm[0] = 8;
	
			state = scr_dash;
			
		if distance_to_object(oPlayer) >= dist_desagress{
			state = scr_slime_escolher_state;
			alarm[0] = irandom_range(120, 240);
		}
		}	
	}
	
}

function scr_slime_atack(){
	sprite_index = spr_slime_atacando;
	
	if image_index >= 6{
		perm_hit = false;
	}
	scr_slime_check();
	scr_slime_colis();
	
	if distance_to_object(oPlayer) >= dist_desagress{
		state = scr_slime_escolher_state;
		alarm[0] = irandom_range(120, 240);
	}
}

function scr_slime_hit(){
	alarm[2] = 120; 
	empurrar_veloc = lerp(empurrar_veloc, 0, 0.05);
	
	hveloc = lengthdir_x(empurrar_veloc, empurrar_dir)
	vveloc = lengthdir_y(empurrar_veloc, empurrar_dir)
	
	scr_slime_colis();  
} 
	
function scr_slime_morte(){
	sprite_index = spr_slime_pequeno_morte;

	if fim_da_animacao(){
		oPlayer.xp += xp_morte;
		audio_play_sound(snd_morte_slime, 1, false);
		
		var chance_drop = irandom_range(0, 100);
		
	    if (chance_drop < 100) { // 30% de chance de dropar um item
	        var item_drop = instance_create_layer(x, y, "Instances", obj_item);
			var arma_ = choose(Armas_Inv.Espada, Armas_Inv.Arco)
	        // Configurações do item dropado
	        // Escolha aleatória do tipo de arma a ser dropada
	        item_drop.tipo_arma = arma_;
	        item_drop.sprite_index = spr_itens;
	        item_drop.quantidade = irandom(2) + 1; // Quantidade(nivel) aleatória entre 1 e 3
			if arma_ = Armas_Inv.Espada{
				item_drop.image_index = 0;
			}else{
				item_drop.image_index = 1;
			}
	    }
		
		instance_destroy();
	}
}

function scr_dash(){
	hveloc = lengthdir_x(dash_veloc, dash_dir);
	vveloc = lengthdir_y(dash_veloc, dash_dir);
	
	scr_slime_colis(); 
	
	var _inst = instance_create_layer(x, y, "Instances", obj_dash);
	_inst.sprite_index = sprite_index;
}