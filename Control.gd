extends Control
func _process(delta):
	if GlobalVar.recursos["Investigacion"] > 502:
		GlobalVar.recursos["Investigacion"] += 1000
		var obj2 = load("res://Graphics/Objetivos Imagenes/ecenas objetivos/obj1.tscn").instance()
		get_parent().add_child(obj2)

