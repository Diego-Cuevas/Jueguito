extends Node2D
var pos = Vector2()
func get_save_stats():
	return{
		'filename' : get_filename(),
		'parent' : get_parent().get_path(),
		'x_pos' : position.x,
		'y_pos' : position.y
	}
func load_save_stats(stats):
	position = Vector2(stats.x_pos,stats.y_pos)
func _process(delta):
	pos = get_parent().get_node("contenedortilemap/TerrenosConstruccion").world_to_map(get_global_mouse_position())
	if GlobalVar.mouse != null:
		for i in get_parent().get_node("contenedortilemap/TerrenosConstruccion").get_used_cells():
			if pos == i:
				GlobalVar.mouse.global_position =pos *get_parent().get_node("contenedortilemap/TerrenosConstruccion").cell_size
			if GlobalVar.mouse.is_in_group("Cons"):
				for g in get_parent().get_node("contenedortilemap/TerrenosConstruccion").get_used_cells_by_id(4):
					if pos == g:
						GlobalVar.posible = true
