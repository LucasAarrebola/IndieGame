 if global.dialogo == false and !instance_exists(obj_transicao){

	var _escala = 3;
	var _guia = display_get_gui_height();
	var _spra = sprite_get_height(spr_hud_vida) * _escala;
	var _huda = _guia - _spra;
 
	var _vida = oPlayer.vida;
	var _maxvida = oPlayer.max_vida[oPlayer.level];

	var _estamina = oPlayer.estamina;
	var _maxestamina = oPlayer.max_estamina[oPlayer.level];

	var _xp = oPlayer.xp
	var _maxxp = oPlayer.max_xp[oPlayer.level];

	var _xpa = sprite_get_height(spr_hud_exp) * _escala;
	
	if _vida >= 1 and _xp >= 0 and _estamina >= 0 {
		
		draw_sprite_ext(spr_hud_barra_vida, 0, 5, _huda, (_vida/_maxvida) * _escala, _escala, 0, c_white, 1);
		draw_sprite_ext(spr_hud_barra_estamina, 0, 5, _huda + 24, (_estamina/_maxestamina) * _escala, _escala, 0, c_white, 1);
		draw_sprite_ext(spr_hud_vida, 0, 5, _huda,_escala, _escala, 0, c_white, 1);

		if oPlayer.level < 10{
			draw_sprite_ext(spr_hud_exp, 0, 0, _guia - _xpa, _escala, _escala, 0, c_white, 1);
			draw_sprite_ext(spr_hud_exp_barra, 0, 9, _guia - _xpa + 9, (_xp/_maxxp) * _escala, _escala, 0, c_white, 1); 
		}
		
		draw_text(10, 670, _vida);
		draw_text(10, 690, _estamina);
		draw_text(680, 740, _xp);
		
	}
} 

