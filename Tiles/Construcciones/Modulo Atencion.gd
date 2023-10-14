extends "res://Tiles/Construcciones/Aerogenerador.gd"

func _process(_delta):
	if $Tiempo_de_produccion.is_stopped():
		$Tiempo_de_produccion.start()
		if (GlobalVar.recursos["Consumo"] - Consumo) < 0:
			GlobalVar.recursos["Consumo"]  = 0
			GlobalVar.recursos["Dinero"] += Consumo
		elif (GlobalVar.recursos["Consumo"] - Consumo) >= 0:
			GlobalVar.recursos["Consumo"] -= Consumo
			GlobalVar.recursos["Dinero"] += Consumo
			GlobalVar.recursos["Mejoras"] += 5
