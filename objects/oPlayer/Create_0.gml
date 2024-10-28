event_inherited();

enum Armas{
	Espada,
	Arco,
	Adaga,
	Altura 
}
//Move
direita = -1;
cima = -1;
esquerda = -1;
baixo = -1;

hveloc = 0;
vveloc = 0;
veloc = 1;
veloc_dir = -1;

dir = 0;

//Dash
dash_dir = -1;
dash_veloc = 6;

//State
state = scr_pers_anda;

//Combate
level = 1;
xp = 0;
max_xp[1]= 100;
max_xp[2]= 150;
max_xp[3]= 200;
max_xp[4]= 250;
max_xp[5]= 300;
max_xp[6]= 350;
max_xp[7]= 450;
max_xp[8]= 500;
max_xp[9]= 550;
max_xp[10]= 700;



max_estamina[1] = 100;
max_estamina[2] = 120;
max_estamina[3] = 150;
max_estamina[4] = 170;
max_estamina[5] = 200;
max_estamina[6] = 220;
max_estamina[7] = 250;
max_estamina[8] = 270;
max_estamina[9] = 300;
max_estamina[10] = 350;
estamina = max_estamina[level];

max_vida[1] = 10;
max_vida[2] = 20;
max_vida[3] = 25;
max_vida[4] = 35;
max_vida[5] = 50;
max_vida[6] = 60;
max_vida[7] = 70;
max_vida[8] = 75;
max_vida[9] = 80;
max_vida[10] = 100;
vida = max_vida[level];

tomardano = true;
empurrar_dir = 0;

dano[1] = 1;
dano[2] = 1;
dano[3] = 2;
dano[4] = 3;
dano[5] = 4;
dano[6] = 5;
dano[7] = 6;
dano[8] = 7;
dano[9] = 8;
dano[10] = 10;

atacar = false;

dano_alfa = -1;

global.arma = 0;