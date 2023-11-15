extends Node

func _on_btnEliminar_button_down():
	pass

func _ready():
	var f = File.new()
	if(f.file_exists('user://save_game.save')):
		load_game()
	if(GlobalVar.new_player):
		print("No hay archivo")
		$Ayuda_View/ConstruccionesLayer/ConstruccionesLayerint.show()

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		save_game()
		get_tree().quit()
	
func save_game():
	var save_file = File.new()
	save_file.open('user://save_game.save', File.WRITE)
	var persistent_nodes := get_tree().get_nodes_in_group('Cons')
	for node in persistent_nodes:
		var node_data = {
			"file_name": node.get_filename(),
			"parent": node.get_parent().get_path(),
			"pos_x": node.global_transform.origin.x,
			"pos_y": node.global_transform.origin.y,
		}
		save_file.store_line(to_json(node_data))
		
	save_file.close()
	
func load_game():
	var save_file = File.new()
	save_file.open('user://save_game.save', File.READ)
	
	var save_nodes = get_tree().get_nodes_in_group("Cons")
	for i in save_nodes:
		i.queue.free()
	
	while save_file.get_position() < save_file.get_len():
		var node_data = parse_json(save_file.get_line())
		var node = load(node_data["file_name"]).instance()
		get_node(node_data["parent"]).add_child(node)
		node.global_transform.origin.x = node_data["pos_x"]
		node.global_transform.origin.y = node_data["pos_y"]
	
	save_file.close()
