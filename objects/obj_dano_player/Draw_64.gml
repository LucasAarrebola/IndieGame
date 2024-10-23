/// @description Inserir descrição aqui
var _cx = camera_get_view_x(view_camera[0]);
var _cy = camera_get_view_y(view_camera[0]);

var _x = (xx - _cx) * escalax;
var _y = (yy - _cy) * escalay;

fontPixel = font_add_sprite_ext(spr_fontnumber, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ()", true, 0);

draw_set_font(fontPixel);
draw_set_alpha(alpha);
draw_text_ext_transformed_color(_x, _y - 40, dano, 50, 500, 1.5, 1.5, 0, c_white, c_white, c_red, c_red, 1);
draw_set_alpha(1);