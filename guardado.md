extend node

var save_filename = "user://game.save" #Creamos una variable para definir el nombre y ruta de nuestro archivo de guardado.

func _ready():
	load_game() #Leer y cargar el archivo de guardado, llamamos la funcion load_game

#Funcion para guardar partida

func save_game():
	var save_file = File.new() #Crear una variable donde guardamos un nuevo archivo
	save_file.open(save_filename, File.WRITE) #Usando el metodo Open vamos a pasarle la ruta de guardado en la variable
	var saved_nodes = get_tree().get_nodes_in_group("Saved") #En esta variable vamos a indicar que guarde solo
	 los nodos que pertenzcan al grupo Saved.
	 
	 for node in saved_nodes:
		if node.filename.empty(): #Si el nombre de archivo esta vacio, quiere decir que el nodo ha sido
								instanciado y, por lo tanto, debe ser omitido.
								
			break
			
		var node_details = node.get_save_stats() #De lo contrario vamos a guardar en una variable los datos que
												contenga la funcion get_save_stats()
		
		save_file.store_line(to_json(node_details)) #Vamos a indicar que los guarde como una sola linea
													serializable en formato JSON.
	save_file.close() #Cerramos el archivo
	
#Funcion para cargar partida.

func load_game():
	var save_file = File.new() #Para cargar el juego creamos un nuevo archivo
	
	#Este archivo lo utilizaremos para comprobar si ya existe un archivo de guardado.
	if not save_file.file_exists(save_filename):
		return #SI NO lo hubiera, aqui se detiene la funcion de carga.
		
	#Entonces obtenemos los nodos que pertenecen al grupo saved.
	var saved_nodes = get_tree().get_nodes_in_group("Saved")
	
	#Usamos un bucle for los elimnamos para que al cargar los nuevos nodos no haya duplicados.
	for node in saved_nodes:
		node.queue_free()
		
	#Despues leemos el archivo de guardado existente.
	save_file.open(save_filename, File.READ)
	
	#Ahora vamos a usar un bucle while para iterar todos los datos que contenga el archivo guardado
	while save_file.get_position() < save_file.get_len():
		var node_data = parse_json(save_file.get_line()) #Guardamos los datos del nodo leyendo el JSON
		var new_obj = load(node_data.filename).instance() #Creamos un nuevo objeto cargando el nombre del archivo
							e instanciado.
		get_node(node_data.parent).call_deferred('add_child', new_obj) #Accedemos al nodo principal y agregamos el 
					nuevo nodo como hijo.
		new_obj.load_save_stats(node_data) #Y para terminar utilizamos la funcion load_save_stats para 
								cargar los datos guardados.
								
func _notification(what()):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		save_game()
