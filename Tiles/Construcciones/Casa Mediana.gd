extends "res://Tiles/Construcciones/Aerogenerador.gd"

func _process(_delta):
	if $Tiempo_de_produccion.is_stopped():
		$Tiempo_de_produccion.start()
		#if (GlobalVar.recursos["Energía"] - ConsumoDeEnergia) < 0:
		#	GlobalVar.recursos["Energía"]  = 0
		#	GlobalVar.recursos["Consumo"] += ConsumoDeEnergia
		#elif (GlobalVar.recursos["Energía"] - ConsumoDeEnergia) >= 0:
		#	GlobalVar.recursos["Energía"] -= ConsumoDeEnergia
		#	GlobalVar.recursos["Consumo"] += ConsumoDeEnergia
		GlobalVar.recursos["Mejoras"] += 15
		GlobalVar.recursos["Reparación"] += 15
