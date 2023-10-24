extends Node2D
export var nivel = 1
export var ConsumoDeEnergia = 0
export var Consumo = 0
export var precio = 50
export var desc = "Aerogenerador"
export var costo_mejora = 100
export var costo_dinero = 500
export var bloqueo = "True"
export var Produccion = 5
export var TipoProduccion = "Calorxm"
export var Descri = "Un aerogenerador es un generador eléctrico que funciona convirtiendo la energía cinética del viento en energía mecánica a través de una hélice en energía eléctrica gracias a un alternador (generador de corriente eléctrica alterna). Produce 5 unidades de energía."

func _process(_delta):
	if $Tiempo_de_produccion.is_stopped():
		$Tiempo_de_produccion.start()
		GlobalVar.recursos["Energía"] += Produccion
		
func get_save_stats():
	return{
		'file_name' : get_filename(),
		'parent' : get_parent().get_path(),
		'x_pos' : position.x,
		'y_pos' : position.y
	}
	
func load_save_stats(stats):
	position = Vector2(stats.x_pos,stats.y_pos)
