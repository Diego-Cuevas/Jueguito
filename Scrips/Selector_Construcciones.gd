extends Control

var en_contruccion =null
var validacion
var construccion_valida = true
var cont = 0
var contruccion_actual = null
var fab
var eliminar_nodo = null
var contruccion_actual2 = null
signal cambiar_datos
var BLOQUEO
var nuevoEdificio = null
var nuevoEdificio2 = null
var contConstrucciones = 5

func _process(_delta):
	pass

func _ready():
	visible = false
	connect("cambiar_datos",self,"_cambiar_datos")
	_cambiar_datos()

func _cambiar_datos(): 
#if str(get_node("ConstruccionesLayer/ConstruccionesLayerint/VBoxContainer/NinePatchRect/btnBloqueo").text) == "Truew":
	get_node("ConstruccionesLayer/ConstruccionesLayerint/VBoxContainer/NinePatchRect/icon").texture = GlobalVar.construcciones[cont].instance().get_node("construccion23/sprite23").texture
	get_node("ConstruccionesLayer/ConstruccionesLayerint/VBoxContainer/NinePatchRect/btnnombre").text = str(GlobalVar.construcciones[cont].instance().desc)
	get_node("ConstruccionesLayer/ConstruccionesLayerint/VBoxContainer/NinePatchRect/CDinero/text").text = str(GlobalVar.construcciones[cont].instance().precio)
	get_node("ConstruccionesLayer/ConstruccionesLayerint/VBoxContainer/NinePatchRect/descri").text = str(GlobalVar.construcciones[cont].instance().Descri)

func _construir():
	GlobalVar.validacion[validacion] = true
	nuevoEdificio = null
	if GlobalVar.recursos["Dinero"] >= GlobalVar.construcciones[cont].instance().precio:
		nuevoEdificio = GlobalVar.construcciones[cont].instance()
		get_parent().get_node("Construcciones").add_child(nuevoEdificio)
		GlobalVar.recursos["Dinero"] -= nuevoEdificio.precio
		GlobalVar.recursosxm[nuevoEdificio.TipoProduccion] += nuevoEdificio.Produccion
		GlobalVar.mouse = nuevoEdificio
		contruccion_actual = nuevoEdificio
		if contConstrucciones == get_parent().get_node("Construcciones").get_child_count():
			var o ="CUMPLIDO" == GlobalVar.EstadoObjetivos[0]
			GlobalVar.recursos["Dinero"] += 1000
			GlobalVar.recursos["Mejoras"] += 1000
			var obj1 = load("res://Graphics/Objetivos Imagenes/ecenas objetivos/obj1.tscn").instance()
			get_parent().add_child(obj1)
			GlobalVar.EstadoObjetivos[0] = "CUMPLIDO"

func _on_Button_izq_pressed():
	cont -= 1
	if cont < 0:
		cont = GlobalVar.construcciones.size()-1
	BLOQUEO = str(GlobalVar.construcciones[cont].instance().desc)
	if GlobalVar.bloqueo[BLOQUEO]  == true:
		emit_signal("cambiar_datos")
	else:
		while GlobalVar.bloqueo[BLOQUEO] != true:
			cont -= 1
			if cont  < 0:
				cont = GlobalVar.construcciones.size()-1
			BLOQUEO = str(GlobalVar.construcciones[cont].instance().desc)
			if GlobalVar.bloqueo[BLOQUEO] == true:
				emit_signal("cambiar_datos")

func _on_Button_Der_pressed(): 
	cont += 1
	if cont  >= GlobalVar.construcciones.size():
		cont = 0
	BLOQUEO = str(GlobalVar.construcciones[cont].instance().desc)
	if GlobalVar.bloqueo[BLOQUEO] == true:
		emit_signal("cambiar_datos")
	else:
		while GlobalVar.bloqueo[BLOQUEO] != true:
			cont += 1
			if cont  >= GlobalVar.construcciones.size():
				cont = 0
			BLOQUEO = str(GlobalVar.construcciones[cont].instance().desc)
			if GlobalVar.bloqueo[BLOQUEO] == true:
				emit_signal("cambiar_datos")

	emit_signal("cambiar_datos")

func _on_btnComprar_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			validacion = str(GlobalVar.construcciones[cont].instance().desc)
			if GlobalVar.validacion[validacion] == false:
				if GlobalVar.recursos["Dinero"] >= GlobalVar.construcciones[cont].instance().precio:
					$ConstruccionesLayer/ConstruccionesLayerint.hide()
					$ConstruccionesLayer/ConstruccionesLayerintAceptar.show()
					_construir()
				else:
					$ConstruccionesLayer/ConstruccionesLayerint.hide()
					$ConstruccionesLayer/ConstruccionesLayerintMen.show()
			else:
				for key in GlobalVar.validacion:
					if GlobalVar.validacion[key] == false:
						construccion_valida = false
				if construccion_valida:
					$ConstruccionesLayer/ConstruccionesLayerint.hide()
					$ConstruccionesLayer/ConstruccionesLayerintAceptar.show()
					_construir()
				else:
					$ConstruccionesLayer/ConstruccionesLayerint.hide()
					$ConstruccionesLayer/ConstruccionesLayerintBloq.show()
					$ConstruccionesLayer/ConstruccionesLayerintBloq/VBoxContainerMen/NinePatchRectMen/Edificios.text = ""
					for value in GlobalVar.validacion.keys():
						if GlobalVar.validacion[value] == false:
							$ConstruccionesLayer/ConstruccionesLayerintBloq/VBoxContainerMen/NinePatchRectMen/Edificios.text += value+"\n"

func _on_btnAceptar_pressed():
	if GlobalVar.posible:
		contruccion_actual.global_position = GlobalVar.mouse.global_position
		contruccion_actual = null
		GlobalVar.mouse = null
		GlobalVar.posible = false
	else:
		$ConstruccionesLayer/ConstruccionesLayerintMen2.show()
		$ConstruccionesLayer/ConstruccionesLayerintAceptar.show()
	pass # Replace with function body.

func _on_btnAceptar_gui_input(event):
	pass # Replace with function body.

func _on_btnEliminar_pressed():
	if GlobalVar.posible:
		contruccion_actual.global_position = GlobalVar.mouse.global_position
		contruccion_actual = null
		GlobalVar.mouse = null
		GlobalVar.posible = false
	else:
		$ConstruccionesLayer/ConstruccionesLayerintMen2.show()
		$ConstruccionesLayer/ConstruccionesLayerintAceptar.show()
	pass # Replace with function body.
	#_eliminarConstruccion()

func _on_btnAceptarMen_pressed():
	_eliminarConstruccion()
	pass

func _on_btnAceptarMen_gui_input(event):
	if GlobalVar.posible:
		contruccion_actual.global_position = GlobalVar.mouse.global_position
		contruccion_actual = null
		GlobalVar.mouse = null
		GlobalVar.posible = false
	#else:
		#$ConstruccionesLayer/ConstruccionesLayerintMen2.show()
		#$ConstruccionesLayer/ConstruccionesLayerintAceptar.show()
	pass # Replace with function body.

func _eliminarConstruccion(): 	
	nuevoEdificio = GlobalVar.Eliminar[0].instance()
	nuevoEdificio2 = GlobalVar.Replace[0].instance()
	get_parent().get_node("Eliminar").add_child(nuevoEdificio)
	get_parent().get_node("Eliminar").add_child(nuevoEdificio2)
	GlobalVar.mouse = nuevoEdificio
	contruccion_actual = nuevoEdificio2

func _on_btnEliminar_button_down():
	if GlobalVar.posible:
		nuevoEdificio.global_position = GlobalVar.mouse.global_position
		contruccion_actual.global_position = GlobalVar.mouse.global_position
		contruccion_actual = null
		GlobalVar.mouse = null
		GlobalVar.posible = false
	else:
		$ConstruccionesLayerintMenEliminar.show()
