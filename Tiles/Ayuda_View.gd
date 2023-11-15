extends Control

var cont = 0

signal cambiar_datosmensaje

func _cambiar_datosmensaje():
	get_node("ConstruccionesLayer/ConstruccionesLayerint/VBoxContainer/NinePatchRect/Label").text = str(GlobalVar.MensajesAyuda[cont])
	get_node("ConstruccionesLayer/ConstruccionesLayerint/VBoxContainer/NinePatchRect/icon").texture = GlobalVar.ImagenesAyuda[cont].instance().get_node("objetivo/icon").texture

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("cambiar_datosmensaje", self, "_cambiar_datosmensaje")
	_cambiar_datosmensaje()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_izq_pressed():
	cont -= 1
	if cont  < 0:
		cont = GlobalVar.MensajesAyuda.size()-1
	emit_signal("cambiar_datosmensaje")


func _on_Button_Der_pressed(): 
	cont += 1
	if cont  >= GlobalVar.MensajesAyuda.size():
		cont = 0
	emit_signal("cambiar_datosmensaje")
