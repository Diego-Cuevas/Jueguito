extends Control
var cont = 0
signal cambiar_datosmensaje

func _cambiar_datosmensaje():
	
	get_node("ConstruccionesLayer/ConstruccionesLayerint/VBoxContainer/NinePatchRect/Label").text = str(GlobalVar.MensajesObjetivos[cont])
	get_node("ConstruccionesLayer/ConstruccionesLayerint/VBoxContainer/NinePatchRect/CUMPLIDO").text = str(GlobalVar.EstadoObjetivos[cont])
	get_node("ConstruccionesLayer/ConstruccionesLayerint/VBoxContainer/NinePatchRect/icon").texture = GlobalVar.ImagenesObjetivos[cont].instance().get_node("objetivo/icon").texture
func _ready():
	connect("cambiar_datosmensaje",self,"_cambiar_datosmensaje")
	_cambiar_datosmensaje()
	pass # Replace with function body.

func _on_Button_izq_pressed():
	cont -= 1
	if cont  < 0:
		cont =GlobalVar.MensajesObjetivos.size()-1
	emit_signal("cambiar_datosmensaje")

func _on_Button_Der_pressed(): 
	cont += 1
	if cont  >= GlobalVar.MensajesObjetivos.size():
		cont = 0
	emit_signal("cambiar_datosmensaje")
