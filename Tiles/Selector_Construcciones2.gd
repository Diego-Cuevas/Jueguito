extends Control

var en_contruccion2 =null
var cont2 = 0
var contruccion_actual2 = null
var BLOQUEO 

signal cambiar_datos2

func _process(_delta):
	pass

func _ready():
	visible = false
	connect("cambiar_datos2", self, "_cambiar_datos2")
	_cambiar_datos2()

func _construir():
	if GlobalVar.recursos["Mejoras"] >= GlobalVar.construcciones[cont2].instance().costo_investigacion && GlobalVar.recursos["Dinero"] >= GlobalVar.construcciones[cont2].instance().costo_dinero:
		GlobalVar.recursos["Mejoras"] -= GlobalVar.construcciones[cont2].instance().costo_investigacion
		GlobalVar.recursos["Dinero"] -= GlobalVar.construcciones[cont2].instance().costo_dinero
		GlobalVar.bloqueo[BLOQUEO] = true

func _cambiar_datos2():
	get_node("ConstruccionesLayer/ConstruccionesLayerint/VBoxContainer/NinePatchRect/icon").texture = GlobalVar.construcciones[cont2].instance().get_node("construccion23/sprite23").texture
	get_node("ConstruccionesLayer/ConstruccionesLayerint/VBoxContainer/NinePatchRect/btnnombre").text = str(GlobalVar.construcciones[cont2].instance().desc)
	get_node("ConstruccionesLayer/ConstruccionesLayerint/VBoxContainer/NinePatchRect/CInvestigacion/text").text = str(GlobalVar.construcciones[cont2].instance().costo_mejora)
	get_node("ConstruccionesLayer/ConstruccionesLayerint/VBoxContainer/NinePatchRect/CDinero/text").text = str(GlobalVar.construcciones[cont2].instance().costo_dinero)
	get_node("ConstruccionesLayer/ConstruccionesLayerint/VBoxContainer/NinePatchRect/descri").text = str(GlobalVar.construcciones[cont2].instance().Descri)

func _on_Button_izq2_pressed():
	cont2 -= 1
	if cont2  < 0:
		cont2 = GlobalVar.construcciones.size()-1
	BLOQUEO = str(GlobalVar.construcciones[cont2].instance().desc)
	if GlobalVar.bloqueo[BLOQUEO]  != true:
		emit_signal("cambiar_datos2")
	else:
		while GlobalVar.bloqueo[BLOQUEO] == true:
			cont2 -= 1
			if cont2  < 0:
				cont2 = GlobalVar.construcciones.size()-1
			BLOQUEO = str(GlobalVar.construcciones[cont2].instance().desc)
			if GlobalVar.bloqueo[BLOQUEO] != true:
				emit_signal("cambiar_datos2")

func _on_Button_Der2_pressed():
	cont2 += 1
	if cont2  >= GlobalVar.construcciones.size():
		cont2 = 0
	BLOQUEO = str(GlobalVar.construcciones[cont2].instance().desc)
	if GlobalVar.bloqueo[BLOQUEO] != true:
		emit_signal("cambiar_datos2")
	else:
		while GlobalVar.bloqueo[BLOQUEO] == true:
			cont2 += 1
			if cont2  >= GlobalVar.construcciones.size():
				cont2 = 0
			BLOQUEO = str(GlobalVar.construcciones[cont2].instance().desc)
			if GlobalVar.bloqueo[BLOQUEO] != true:
				emit_signal("cambiar_datos2")

func _on_btnComprar2_pressed():
	if GlobalVar.recursos["Mejoras"] >= GlobalVar.construcciones[cont2].instance().costo_investigacion && GlobalVar.recursos["Dinero"] >= GlobalVar.construcciones[cont2].instance().costo_dinero:
		_construir()
		$ConstruccionesLayer/ConstruccionesLayerint.hide()
	else:
		$ConstruccionesLayer/ConstruccionesLayerint.hide()
		$ConstruccionesLayer/ConstruccionesLayerintMen.show()

func _on_ConstruccionesLayerint_visibility_changed():
	cont2 -= 1
	if cont2  < 0:
		cont2 = GlobalVar.construcciones.size()-1
	BLOQUEO = str(GlobalVar.construcciones[cont2].instance().desc)
	if GlobalVar.bloqueo[BLOQUEO]  != true:
		emit_signal("cambiar_datos2")
	else:
		while GlobalVar.bloqueo[BLOQUEO] == true:
			cont2 -= 1
			if cont2  < 0:
				cont2 = GlobalVar.construcciones.size()-1
			BLOQUEO = str(GlobalVar.construcciones[cont2].instance().desc)
			if GlobalVar.bloqueo[BLOQUEO] != true:
				emit_signal("cambiar_datos2")
