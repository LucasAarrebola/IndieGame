instance_create_layer(0, 0, "Instances", obj_transicao);

if obj_transicao.img - obj_transicao.img_num > obj_transicao.cols + 1{
	room_goto(other.sala);
	x = other.personagemx;
	y = other.personagemy;
	
	if other.audio != -1 {
		audio_stop_all();
		audio_play_sound(other.audio, 1, true);
	}
	
	obj_transicao.entrando = false;
	
}