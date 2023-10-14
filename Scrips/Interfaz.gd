extends CanvasLayer

const archivo = "user://SAVEFILE.save"
var url = 'https://cfetycoon.000webhostapp.com/api/create_player'
var player_data = {}
var logged = false

func _ready():
	var f = File.new()
	if(f.file_exists(archivo)):
		f.open(archivo, File.READ)
		GlobalVar.player_data = f.get_var()
		f.close()
		$Label.text = "Bienvenido\n"+GlobalVar.player_data["user_name"]
		$UserName.hide()
		logged = true
	

func _on_AddUser_request_completed(result, response_code, headers, body):
	var response = body.get_string_from_utf8()
	var uuid = response
	GlobalVar.player_data["uuid"] = uuid
	var f = File.new()
	f.open(archivo, File.WRITE)
	f.store_var(GlobalVar.player_data)
	f.close()
	
func _on_Iniciar_pressed():

	get_tree().change_scene("res://Tiles/contenedortilemap.tscn")
	pass # Replace with function body.

func _on_Iniciar_pressed():
	if logged:
		get_tree().change_scene("res://Tiles/contenedortilemap.tscn")
	else:
		GlobalVar.player_data = {
			"user_name":$UserName.text
		} 
		var data = {
			"user_name": $UserName.text
		}
		var envio = JSON.print(data)
		$AddUser.request(url,["Content-Type: application/json"],true,HTTPClient.METHOD_POST, envio)
	pass # Replace with function body.



