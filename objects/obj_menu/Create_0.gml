image_alpha = 0;

inventario = false;
escala = 4;

inicio_x = 5 * escala;
inicio_y = 21 * escala;

slots_h = 4;
slots_v = 3;
total_slots = slots_h * slots_v;
tamanho_slots = 16 * escala;
buffer = 1 * escala; 

inv_l = sprite_get_width(spr_inv) * escala;
inv_a = sprite_get_height(spr_inv) * escala;

item_select = -1;
pos_select = -1;

enum Armas_Inv{
	Espada,
	Arco,
	Adaga,
	Altura
}

enum Armas_Demon{
	Espada,
	Arco,
	Adaga,
	Altura
}

enum Infos_Inv{
	Item,
	Quantidade,
	Sprite,
	Altura
}

grid_items = ds_grid_create(Infos_Inv.Altura, total_slots);
ds_grid_set_region(grid_items, 0, 0, Infos_Inv.Altura - 1, total_slots - 1, -1); 

grid_add_item(Armas_Inv.Espada, 1, spr_itens);
grid_add_item(Armas_Inv.Arco, 2, spr_itens);

grid_add_item(Armas_Demon.Espada, 1, spr_itens_demon);
grid_add_item(Armas_Demon.Espada, 1, spr_itens_demon);

grid_add_item(Armas_Demon.Arco, 1, spr_itens_demon);
grid_add_item(Armas_Demon.Arco, 1, spr_itens_demon);