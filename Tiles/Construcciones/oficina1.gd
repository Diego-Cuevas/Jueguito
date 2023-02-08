extends "res://Tiles/Construcciones/Aerogenerador.gd"
var Calormenos = 200
var DineroMas = 20
func _process(delta):
	if GlobalVar.recursos["Calor"] >= Calormenos:
		if $Tiempo_de_produccion.is_stopped():
			$Tiempo_de_produccion.start()
			GlobalVar.recursos["Calor"] -= Calormenos
			GlobalVar.recursos["Dinero"] += DineroMas
