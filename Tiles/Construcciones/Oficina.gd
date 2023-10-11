extends "res://Tiles/Construcciones/Aerogenerador.gd"

func _process(_delta):
	if GlobalVar.recursos["Dinero"] >= ConsumoDeEnergia:
		if $Tiempo_de_produccion.is_stopped():
			$Tiempo_de_produccion.start()
			GlobalVar.recursos["Dinero"] -= ConsumoDeEnergia
			GlobalVar.recursos["Mejoras"] += Produccion
