extends "res://Tiles/Construcciones/Aerogenerador.gd"

func _process(delta):
	if $Tiempo_de_produccion.is_stopped():
		$Tiempo_de_produccion.start()
		GlobalVar.recursos["Energía"] -= ConsumoDeEnergia
		GlobalVar.recursos["Dinero"] += Produccion

