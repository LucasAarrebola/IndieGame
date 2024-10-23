function scr_pers_colis(){
	if place_meeting(x + hveloc, y, obj_parede){
		while !place_meeting(x + sign(hveloc), y, obj_parede){
			x += sign(hveloc);
		}
		hveloc = 0
	}

	x += hveloc;

	if place_meeting(x, y + vveloc, obj_parede){
		while !place_meeting(x, y + sign(vveloc), obj_parede){
			y += sign(vveloc);
		}
		vveloc = 0
	}

	y += vveloc;
}

function scr_pers_anda(){
	if !instance_exists(obj_transicao){
		
		direita = keyboard_check(ord("D"));
		cima = keyboard_check(ord("W"));
		esquerda = keyboard_check(ord("A"));
		baixo = keyboard_check(ord("S"));

		hveloc = (direita - esquerda) * veloc;
	
		scr_pers_colis();
	
		vveloc = (baixo - cima) * veloc;
	
	}
	
	dir = floor ((point_direction(x, y, mouse_x, mouse_y) + 45)/90)

	//Sprites
		if hveloc == 0 and vveloc == 0 {
			if obj_menu.inventario = true{
					sprite_index = sPlayerInvFrente;
				}
			else{
				switch dir{
					default:
						sprite_index = sPlayerDireita;
					break;
	
					case 1: 
						sprite_index = sPlayerCosta;
					break;
	
					case 2: 
						sprite_index = sPlayerEsquerda;
					break;
	
					case 3: 
						sprite_index = sPlayerFrente;
					break;
				}
			}
		}	
		else{
			switch dir{
			default:
				sprite_index = sPlayerCDireita;
			break;
	
			case 1: 
				sprite_index = sPlayerCCosta;
			break;
	
			case 2: 
				sprite_index = sPlayerCEsquerda;
			break;
	
			case 3: 
				sprite_index = sPlayerCFrente;
			break;
			}
		}
	if estamina >= 10 {
		if mouse_check_button_pressed(mb_right){
			dash_dir = point_direction(x, y, mouse_x,mouse_y); 
			estamina -= 10;
			alarm[1] = 180;
			alarm[0] = 8;
			
			audio_play_sound(snd_dash, 1, false);
			
			state = scr_pers_dash;
		}
	}	
	if obj_menu.inventario == false{
		if mouse_check_button_pressed(mb_left){
			if global.arma == Armas.Espada{
			image_index = 0;
			switch dir{
				default:
					sprite_index = sPlayerAtqDireita;
				break;
	
				case 1: 
					sprite_index = sPlayerAtqCosta;
				break;
	
				case 2: 
					sprite_index = sPlayerAtqEsquerda;
				break;
	
				case 3: 
					sprite_index = sPlayerAtqFrente;
				break;
			}
			state = scr_pers_atacando;
			}else if global.arma == Armas.Arco{
				image_index = 0;
				state = scr_pers_arco;
				}
			}		
		}
	}
	
function scr_pers_dash(){
	tomardano = false;
	
	hveloc = lengthdir_x(dash_veloc, dash_dir);
	vveloc = lengthdir_y(dash_veloc, dash_dir);
	
	scr_pers_colis();
	
	var _inst = instance_create_layer(x, y, "Instances", obj_dash);
	_inst.sprite_index = sprite_index;
}

function scr_pers_atacando(){
	if image_index >= 1{
		if atacar == false{
			switch dir{
				default:
					instance_create_layer(x + 10, y, "Instances", obj_hit);
				break;
				case 1:
					instance_create_layer(x, y - 10, "Instances", obj_hit);
				break;
				case 2:
					instance_create_layer(x - 10, y, "Instances", obj_hit);
				break;
				case 3:
					instance_create_layer(x, y +10, "Instances", obj_hit);
				break;
				}
				audio_play_sound(snd_hit, 1, false);
				atacar = true;
			}
		}
		
	if fim_da_animacao(){
		state = scr_pers_anda;
		atacar = false; 
	}			
}

function scr_pers_arco(){
	
	dir = floor ((point_direction(x, y, mouse_x, mouse_y) + 45)/90);
	
	switch dir{
		//Direita
		default:
			sprite_index = spr_personagem_arco_direita;	
		break;
		//Cima
		case 1:
			sprite_index = spr_personagem_arco_cima;
		break;
		//Esqueda
		case 2:
			sprite_index = spr_personagem_arco_esquerda;
		break;
		//Baixo
		case 3:
			sprite_index = spr_personagem_arco_baixo;
		break;
	}
	
	if fim_da_animacao(){
		image_index = 4;
	}
	
	if mouse_check_button_released(mb_left){
		
		if image_index >= 4{
			var _dir = point_direction(x, y, mouse_x, mouse_y);
			var _xx = lengthdir_x(5, _dir);
			var _yy = lengthdir_y(5, _dir);
			
			var _inst = instance_create_layer(x + _xx, y + _yy, "Instances", obj_flesha);
				_inst.direction = _dir;
				_inst.image_angle = _dir;
				_inst.speed = 10;
				
			state = scr_pers_anda; 
		}else {
			state = scr_pers_anda;
		}
	}
}	
	
function scr_pers_hit(){
	if alarm[2] > 0{
		hveloc = lengthdir_x(3, empurrar_dir);
		vveloc = lengthdir_y(3, empurrar_dir);
	
		scr_pers_colis();
	} else{
		state = scr_pers_anda;
	}
}
	
function scr_perso_morte(){
	sprite_index = spr_personagem_morte;
	
	x = lerp(x, room_width/2, 0.03);
	y = lerp(y, room_height/2, 0.03);
	
	if oPlayer.level >= 2{
		oPlayer.xp -= 100;
		
		if oPlayer.xp <= -1{
			oPlayer.level--;
		}
	}
	
	image_alpha = 1;
	image_xscale += .005;
	image_yscale += .005;
	
	if fim_da_animacao(){
		image_index = 39;
		
		instance_create_layer(0, 0, "Instances", obj_transicao);
		
		if obj_transicao.img - obj_transicao.img_num > obj_transicao.cols + 1{
			obj_transicao.entrando = false;
			
			instance_destroy(obj_controle);
			instance_destroy(camera);
			instance_destroy();
		
			room = Morte;
			audio_stop_all();
			audio_play_sound(snd_tela_de_morte, 1, true);
		}
		
	}
}