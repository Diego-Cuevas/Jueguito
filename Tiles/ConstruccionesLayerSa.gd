extends CanvasLayer

var url = 'http://cfetycoonadmin.test/add_record'
var salir_juego = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_AddRecord_request_completed(result, response_code, headers, body):
	var response = body.get_string_from_utf8()
	print(response)
	if salir_juego:
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
