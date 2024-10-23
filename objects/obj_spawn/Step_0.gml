var _slime = irandom(100);             

if type = "slime"{
if alarm[0] <= 0{
	if _slime <= 100{
		instance_create_layer(x, y, "Instances", obj_slime_pqn);
	}else{
		instance_create_layer(x, y, "Instances", obj_slime_grd);
	}
		alarm[0] = 30 * room_speed;
	}
}

if type = "golem"{
if alarm[0] <= 0{
		instance_create_layer(x, y, "Instances", obj_golem);
		alarm[0] = 45 * room_speed;
	}
	
}