extends CanvasLayer

var url = 'https://cfetycoon.000webhostapp.com/api/add_record'
var salir_juego = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
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

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_AddRecord_request_completed(result, response_code, headers, body):
	var response = body.get_string_from_utf8()
	print(response)
	if salir_juego:
		save_game()
		get_tree().quit()
	else:
		$ConstruccionesLayerint.hide()
	pass # Replace with function body.

func hacer_peticion():
	var data = {
		"user_name":GlobalVar.player_data["user_name"],
		"dinero":GlobalVar.recursos["Dinero"]
	}
	var envio = JSON.print(data)
	$AddRecord.request(url,["Content-Type: application/json"],true,HTTPClient.METHOD_POST, envio)

func _on_SubirDatos_pressed():
	$ConstruccionesLayerint.show()
	pass # Replace with function body.


func _on_Exit_pressed():
	salir_juego = true
	hacer_peticion()
	pass # Replace with function body.


func _on_Save_pressed():
	hacer_peticion()
	pass # Replace with function body.
