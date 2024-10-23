tamanho = sprite_get_width(spr_quad);

cols = ceil(room_width*3 / tamanho);

lins = ceil(room_height*3 / tamanho);

img = 0;

img_vel = sprite_get_speed(spr_quad) / game_get_speed(gamespeed_fps);

img_num = sprite_get_number(spr_quad) - 1;

entrando = true;