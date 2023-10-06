extends CanvasLayer

const ARCHIVO = "user://SAVEFILE.save"
var url = 'http://cfetycoon-laravel.test/api/create_player'
var user_name = ""

func _on_AddUser_request_completed(result, response_code, headers, body):
	var response = body.get_string_from_utf8()
	get_tree().change_scene("res://Tiles/contenedortilemap.tscn")
	pass # Replace with function body.

func _on_Iniciar_pressed():
	user_name = $UserName.text
	var data = {
		"user_name": user_name
	}
	var envio = JSON.print(data)
	$AddUser.request(url,["Content-Type: application/json"],true,HTTPClient.METHOD_POST, envio)
	#get_tree().change_scene("res://Tiles/contenedortilemap.tscn")
	pass # Replace with function body.



