extends Node2D
export var nivel = 1
export var ConsumoDeEnergia = 2
export var precio = 100
export var desc = "Aerogenerador"
export var costo_mejora = 100
export var costo_dinero = 500
export var bloqueo = "True"
export var Produccion = 20
export var TipoProduccion = "Calorxm"
export var Descri = "Un aerogenerador es un generador eléctrico que funciona convirtiendo la energía cinética del viento en energía mecánica a través de una hélice en energía eléctrica gracias a un alternador (generador de corriente eléctrica alterna). Produce 5 unidades de calor."

func _process(_delta):
	if $Tiempo_de_produccion.is_stopped():
		$Tiempo_de_produccion.start()
		GlobalVar.recursos["Energía"] += Produccion
