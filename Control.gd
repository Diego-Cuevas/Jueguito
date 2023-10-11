extends Control

func _process(_delta):
	if GlobalVar.recursos["Mejoras"] > 502:
		GlobalVar.recursos["Mejoras"] += 1000
		var obj2 = load("res://Graphics/Objetivos Imagenes/ecenas objetivos/obj1.tscn").instance()
		get_parent().add_child(obj2)

