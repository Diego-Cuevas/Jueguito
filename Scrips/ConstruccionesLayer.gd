extends CanvasLayer

func _on_constelementos_pressed():
	$ConstruccionesLayerint.show()


func _on_btnSalir_pressed():
	$ConstruccionesLayerint.hide()

func _on_btnComprar_pressed():
	$ConstruccionesLayerint.hide()
	


func _on_btnAceptarMen_pressed():
	$ConstruccionesLayerintMen.hide()
	pass # Replace with function body.


func _on_btnComprar_gui_input(event):
	#$ConstruccionesLayerintAceptar.show()
	pass # Replace with function body.


func _on_btnAceptar_button_down():
	$ConstruccionesLayerintAceptar.hide() # Replace with function body.


func _on_btnAceptarMen2_pressed():
	$ConstruccionesLayerintMen2.hide()
	pass # Replace with function body.


func _on_btnAceptarMenBloq_pressed():
	$ConstruccionesLayerintBloq.hide()
	pass # Replace with function body.
