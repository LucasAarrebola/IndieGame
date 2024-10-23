valor = 0;

shake_pos = function(){
	var _val =  random_range (-valor, valor);
	
	if (valor != 0){
		valor = lerp(valor, 0, .2);
		
		if (valor <= .1) valor = 0;
		
		view_set_xport(0 , _val);
		view_set_yport(0 , _val);
	}
}