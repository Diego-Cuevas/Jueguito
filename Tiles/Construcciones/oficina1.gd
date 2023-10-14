extends "res://Tiles/Construcciones/Aerogenerador.gd"

var Energiamenos = 200
var DineroMas = 20

func _process(delta):
	if GlobalVar.recursos["Energía"] >= Energiamenos:
		if $Tiempo_de_produccion.is_stopped():
			$Tiempo_de_produccion.start()
			GlobalVar.recursos["Energía"] -= Energiamenos
			GlobalVar.recursos["Dinero"] += DineroMas
