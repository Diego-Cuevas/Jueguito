extends "res://Tiles/Construcciones/Aerogenerador.gd"
var ProduccionMejora = 50

func _process(delta):
	if $Tiempo_de_produccion.is_stopped():
		$Tiempo_de_produccion.start()
		GlobalVar.recursos["Mejoras"] += ProduccionMejora
		
