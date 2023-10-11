extends CanvasLayer

func _on_Delate_pressed():
	$ConstruccionesLayerintMen.show()

func _on_btnAceptarMen_pressed():
	$ConstruccionesLayerintAceptar.show()
	$ConstruccionesLayerintMen.hide()

func _on_btnAceptar_pressed():
	if GlobalVar.mouse == null:
		$ConstruccionesLayerintAceptar.hide()

func _on_btnAceptarMenEliminar_pressed():
	$ConstruccionesLayerintAceptar.show()
 # Replace with function body.
