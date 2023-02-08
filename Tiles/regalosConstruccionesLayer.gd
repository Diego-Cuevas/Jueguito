extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	pass # Replace with function body.

func _on_btnSalir_pressed():
	$ConstruccionesLayerint.hide()


func _on_btnSalir2_pressed():
	$ConstruccionesLayerint.hide()



func _on_btnContestar_button_down():
	$ConstruccionesLayerint.hide()


func _on_btnComprar_pressed():
	$ConstruccionesLayerint.show()
	


func _on_btnComprar_button_down():
	
	$ConstruccionesLayerint.show()


func _on_btnComprar_gui_input(event):

	$ConstruccionesLayerint.show()
		 # Replace with function body.


func _on_Delate_pressed():
	$ConstruccionesLayerint.show()
	pass # Replace with function body.
