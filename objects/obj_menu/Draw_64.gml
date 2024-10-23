fontPixel = font_add_sprite_ext(spr_fontnumber, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ()", true, 0);

var _guil = display_get_gui_width();
var _guia = display_get_gui_height();

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if inventario = true{
	image_alpha += .1;
	
	var _invx = _guil - (escala * 77) - 10;
	var _invy = _guia - (escala * 75) - 25;
	
	draw_sprite_ext(spr_inv, 0, _invx, _invy, escala, escala, 0, c_white, image_alpha);
	
	var ix = 0;
	var iy = 0;
	
	for(var i = 0; i < total_slots; i++){
		var _slotsx = _invx + inicio_x + ((tamanho_slots + buffer) * ix);
		var _slotsy = _invy + inicio_y + ((tamanho_slots + buffer) * iy);

		if point_in_rectangle(_mx, _my, _slotsx, _slotsy, _slotsx + tamanho_slots, _slotsy + tamanho_slots){
			draw_sprite_ext(spr_inv_select, 0, _slotsx, _slotsy, escala, escala, 0, c_white, image_alpha);
			
			if keyboard_check_pressed(ord("V")){
				var _inst = instance_create_layer(oPlayer.x, oPlayer.y - 8,"Instances", obj_item)
				_inst.sprite_index = grid_items[# Infos_Inv.Sprite, i];
				_inst.image_index = grid_items[# Infos_Inv.Item, i];
				_inst.quantidade = grid_items[# Infos_Inv.Quantidade, i]; 
				
				if item_select == grid_items[# Infos_Inv.Item, i] and pos_select == i{
					item_select = -1;
					pos_select = -1;
				}
				
				//Esvaziando Slot Dropado
				grid_items[# Infos_Inv.Item, i] = -1;
				grid_items[# Infos_Inv.Quantidade, i] = -1;
				grid_items[# Infos_Inv.Sprite, i] = -1;
			}
			
			if mouse_check_button_pressed(mb_left){
				if item_select == -1{
					item_select = grid_items[# Infos_Inv.Item, i];
					pos_select = i;
				}
				else{
					//1 - Caso o item selecionado seja igual que o outro
					if item_select == grid_items[# Infos_Inv.Item, i] and pos_select != i and grid_items[# Infos_Inv.Sprite, i] == grid_items[# Infos_Inv.Sprite, pos_select] and grid_items[# Infos_Inv.Quantidade, i] == grid_items[# Infos_Inv.Quantidade, pos_select]
					{
						grid_items[# Infos_Inv.Quantidade, i] += 1;
						
						grid_items[# Infos_Inv.Item, pos_select] = -1;
						grid_items[# Infos_Inv.Quantidade, pos_select] = -1;
						grid_items[# Infos_Inv.Sprite, pos_select] = -1;
						item_select = -1;
						pos_select = -1;
					}
					//2 - Caso o slot selecinado esteja vazio
					else if grid_items[# Infos_Inv.Item, i] == -1{
						grid_items[# Infos_Inv.Item, i] = grid_items[# Infos_Inv.Item, pos_select];
						grid_items[# Infos_Inv.Quantidade, i] = grid_items[# Infos_Inv.Quantidade, pos_select];
						grid_items[# Infos_Inv.Sprite, i] = grid_items[# Infos_Inv.Sprite, pos_select];
						
						grid_items[# Infos_Inv.Item, pos_select] = -1;
						grid_items[# Infos_Inv.Quantidade, pos_select] = -1;
						grid_items[# Infos_Inv.Sprite, pos_select] = -1;
						item_select = -1;
						pos_select = -1;
					}
					//3 - Caso o slot selecinado ja tenha um item e iremos trocalos as posições
					else if grid_items[# Infos_Inv.Item, pos_select] != grid_items[# Infos_Inv.Item, i] or grid_items[# Infos_Inv.Sprite, pos_select] != grid_items[# Infos_Inv.Sprite, i]{
						var _item = grid_items[# Infos_Inv.Item, i];
						var _quantidade = grid_items[# Infos_Inv.Quantidade, i];
						var _spr = grid_items[# Infos_Inv.Sprite, i];
						
						grid_items[# Infos_Inv.Item, i] = grid_items[# Infos_Inv.Item, pos_select];
						grid_items[# Infos_Inv.Quantidade, i] = grid_items[# Infos_Inv.Quantidade, pos_select];
						grid_items[# Infos_Inv.Sprite, i] = grid_items[# Infos_Inv.Sprite, pos_select];
						
						grid_items[# Infos_Inv.Item, pos_select] = _item;
						grid_items[# Infos_Inv.Quantidade, pos_select] = _quantidade;
						grid_items[# Infos_Inv.Sprite, pos_select] = _spr;
						
						item_select = -1;
						pos_select = -1;
					}else if item_select == grid_items[# Infos_Inv.Item, i] and pos_select == i{
							item_select = -1;
							pos_select = -1;
					}
					
				}
			}
		}
		
		var _sprite = grid_items[# Infos_Inv.Sprite, i];
		
		if grid_items[# Infos_Inv.Item, i] != -1{
			//Sprite
			draw_sprite_ext(_sprite, grid_items[# 0, i], _slotsx, _slotsy, escala, escala, 0, c_white, image_alpha);
			draw_set_font(fontPixel);
			//Quantidade
			if grid_items[# Infos_Inv.Quantidade, i] != 1{
				draw_text(_slotsx + tamanho_slots - 16, _slotsy + tamanho_slots - 16, grid_items[# Infos_Inv.Quantidade, i]);
			}
		}
		ix++;
		if ix >= slots_h{
			ix = 0;
			iy++
		}
	}
	
	if item_select != -1{
		draw_sprite_ext(grid_items[# Infos_Inv.Sprite, pos_select], item_select, _mx, _my, escala, escala, 0, c_white, .8);
	}
	
	if mouse_check_button_pressed(mb_right){
		item_select = -1;
		pos_select = -1;
	}
}

draw_set_font(fontPixel);