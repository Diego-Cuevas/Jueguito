extends CanvasLayer

const archivo = "user://SAVEFILE.save"
var url = 'http://cfetycoon-laravel.test/api/create_player'
var user_name = ""
var uuid = ""

func _on_AddUser_request_completed(result, response_code, headers, body):
	var response = body.get_string_from_utf8()
	var uuid = response
	var f = File.new()
	f.open(archivo, File.WRITE)
	f.store_var(uuid)
	f.close()
	
	get_tree().change_scene("res://Tiles/contenedortilemap.tscn")
	pass # Replace with function body.

func _on_Iniciar_pressed():
	var f = File.new()
	if(f.file_exists(archivo)):
		f.open(archivo, File.READ)
		uuid = f.get_var()
		f.close()
		print(uuid)
	else:
		print("No hay archivo")
	#user_name = $UserName.text
	#var data = {
	#	"user_name": user_name
	#}
	#var envio = JSON.print(data)
	#$AddUser.request(url,["Content-Type: application/json"],true,HTTPClient.METHOD_POST, envio)
	#get_tree().change_scene("res://Tiles/contenedortilemap.tscn")
	pass # Replace with function body.



