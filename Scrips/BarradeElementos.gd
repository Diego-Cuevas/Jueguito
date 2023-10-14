extends CanvasLayer

var url = 'https://cfetycoon.000webhostapp.com/api/add_record'

func MostrarElemetos():
	$Menu/Opciones.hide()
	$Menu/constelementos.show()
	$Menu/Update.show()
	#$Menu/Reparadores.show()
	$Menu/Delate.show()
	$Menu/back.show()

func OcultarElemetos():
	$Menu/Opciones.show()
	$Menu/constelementos.hide()
	$Menu/Update.hide()
	#$Menu/Reparadores.hide()
	$Menu/Delate.hide()
	$Menu/back.hide()

func AyudaOcultar():
	$Ayuda/Configuracion2.hide()
	$Ayuda/Ayuda.show()
	$Ayuda/Estadisticas.show()
	$Ayuda/Objetivos.show()
	$Ayuda/Configuracion.show()
	$Ayuda/Configuracion3.show()

	$Ayuda/SubirDatos.show()

func Ayudaregresar():
	$Ayuda/Configuracion2.show()
	$Ayuda/Ayuda.hide()
	$Ayuda/Estadisticas.hide()
	$Ayuda/Objetivos.hide()
	$Ayuda/Configuracion.hide()
	$Ayuda/Configuracion3.hide()

	$Ayuda/SubirDatos.hide()

func _on_Opciones_pressed():
	MostrarElemetos()

func _on_back_pressed():
	OcultarElemetos()

func _on_Configuracion2_pressed():
	AyudaOcultar()

func _on_Configuracion3_pressed():
	Ayudaregresar()

func _on_Ayuda_pressed():
	Ayudaregresar()

func _on_Estadisticas_pressed():
	Ayudaregresar() # Replace with function body.

func _on_Configuracion_pressed():
	Ayudaregresar()

func _on_constelementos_pressed():
	OcultarElemetos()
	pass # Replace with function body.

func _on_Update_pressed():
	OcultarElemetos()
	pass # Replace with function body.

func _on_Delate_pressed():
	OcultarElemetos()
	pass # Replace with function body.


func _on_AddRecord_request_completed(result, response_code, headers, body):
	var response = body.get_string_from_utf8()
	print(response)
	get_tree().quit()
	pass # Replace with function body.

func _on_SubirDatos_pressed():
	var data = {
		"user_name":GlobalVar.player_data["user_name"],
		"dinero":GlobalVar.recursos["Dinero"]
	}
	var envio = JSON.print(data)
	$AddRecord.request(url,["Content-Type: application/json"],true,HTTPClient.METHOD_POST, envio)
	pass # Replace with function body.



