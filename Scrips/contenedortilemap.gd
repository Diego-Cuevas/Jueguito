extends Node2D

var Regalo = 1000
var GlobalPosition = Vector2()

func _process(_delta):
	if GlobalVar.recursos["Mejoras"] == 1000:
		GlobalVar.recursos["Mejoras"] += 1000
		var obj2 = load("res://Graphics/Objetivos Imagenes/ecenas objetivos/obj2.tscn").instance()
		get_parent().add_child(obj2)
		GlobalVar.EstadoObjetivos[1] = "CUMPLIDO"
	if GlobalVar.recursos["Dinero"] == 20000:
		GlobalVar.recursos["Dinero"] += 20000
		var obj2 = load("res://Graphics/Objetivos Imagenes/ecenas objetivos/obj3.tscn").instance()
		get_parent().add_child(obj2)
		GlobalVar.EstadoObjetivos[2] = "CUMPLIDO"
	if GlobalVar.recursosxm["Calorxm"] == 1000:
		GlobalVar.recursos["Energía"] += 500
		GlobalVar.recursos["Mejoras"] += 500
		var obj2 = load("res://Graphics/Objetivos Imagenes/ecenas objetivos/obj4.tscn").instance()
		get_parent().add_child(obj2)
		GlobalVar.EstadoObjetivos[2] = "CUMPLIDO"
		
	if $TimerRegalos.is_stopped():
		$TimerRegalos.start()
		get_parent().get_node("Barra de Elementos/Regalo_View2").show()

func _on_btnSalir_pressed():	
	get_parent().get_node("Regalos_View/ConstruccionesLayer/ConstruccionesLayerint").hide()
	GlobalVar.recursos["Dinero"] += Regalo

func _on_btnRegalo_pressed():
	get_parent().get_node("Barra de Elementos/Regalo_View2").hide()
	get_parent().get_node("Regalos_View/ConstruccionesLayer/ConstruccionesLayerint").show()

func _on_Button_pressed():
	get_parent().get_node("Regalos_View/ConstruccionesLayer/ConstruccionesLayerint").hide()
	get_parent().get_node("Regalos_View2/ConstruccionesLayer/ConstruccionesLayerint").show()
	pass # Replace with function body.

func _on_btnContestar_pressed():
	OS.shell_open("https://forms.gle/Wb4mLNxyXPPe66hUA")
	get_parent().get_node("Regalos_View2/ConstruccionesLayer/ConstruccionesLayerint").hide()
	get_parent().get_node("contenedortilemap/Node2D/Sprite2").hide() 
	pass # Replace with function body.

func _on_ApagarMButton_pressed():
	GlobalVar.save_game()
	get_tree().get_nodes_in_group("bgm")[0].volume_db = -80 # Replace with function body.

func _on_EncenderMButton_pressed():
	get_tree().get_nodes_in_group("bgm")[0].volume_db = 0 

func _on_btnPrueba_pressed():
	get_node("terrenos").get_cellv(GlobalPosition)

func _on_Opciones_gui_input(event):
	pass # Replace with function body.

func _on_btnComprar_gui_input(event):
	$TerrenosConstruccion.show()
	$TerrenosCamara.hide()
	pass

func _on_btnContestar_gui_input(event):
	$TerrenosCamara.show() # Replace with function body.
	$TerrenosConstruccion.hide()

func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()

func _on_btnComprar_pressed():
	$TerrenosConstruccion.show()
	$TerrenosCamara.hide() # Replace with function body.

func _on_btnAceptarMen_pressed():
	$TerrenosConstruccion.show()
	$TerrenosCamara.hide()
	pass # Replace with function body.

func _on_btnEliminar_pressed():
	pass # Replace with function body.
