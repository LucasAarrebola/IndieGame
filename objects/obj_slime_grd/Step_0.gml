event_inherited();

if vida <= 0{	
	oPlayer.xp += xp_morte; 
	
	audio_play_sound(snd_morte_slime, 1, false);
	
	instance_create_layer(x, y, "Instances", obj_slime_pqn);
	instance_create_layer(x + 5, y + 2, "Instances", obj_slime_pqn);
	instance_create_layer(x + 6, y - 4, "Instances", obj_slime_pqn);
}