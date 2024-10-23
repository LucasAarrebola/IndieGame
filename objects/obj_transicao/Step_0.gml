if entrando{
	img += img_vel;
}else{
	img -= img_vel;
	if img < -5{
		instance_destroy();
	}
}