extends "res://Tiles/Construcciones/Aerogenerador.gd"

func _process(_delta):
	if $Tiempo_de_produccion.is_stopped():
		$Tiempo_de_produccion.start()
		if (GlobalVar.recursos["Energía"] - ConsumoDeEnergia) < 0:
			GlobalVar.recursos["Energía"]  = 0
			GlobalVar.recursos["Consumo"] += ConsumoDeEnergia
		elif (GlobalVar.recursos["Energía"] - ConsumoDeEnergia) >= 0:
			GlobalVar.recursos["Energía"] -= ConsumoDeEnergia
			GlobalVar.recursos["Consumo"] += ConsumoDeEnergia

func get_save_stats():
	return{
		'file_name' : get_filename(),
		'parent' : get_parent().get_path(),
		'x_pos' : position.x,
		'y_pos' : position.y
	}
	
func load_save_stats(stats):
	position = Vector2(stats.x_pos,stats.y_pos)
