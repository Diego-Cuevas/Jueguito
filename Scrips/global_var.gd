extends Node
var save_filename = "user://save_game.save"  #Ccreamos una variable para definir el nombre y ruta de nuestro  archivo de guardado
var recursos= {"Dinero":500,"Investigacion":500,"Calor":500}
var recursosxm= {"Dineroxm":0,"Investigacionxm":0,"Calorxm":0}
var construcciones=[load("res://Tiles/Construcciones/Aerogenerador.tscn"),load("res://Tiles/Construcciones/Panel Solar.tscn"),load("res://Tiles/Construcciones/Central Gas.tscn"),load("res://Tiles/Construcciones/Reactor Nuclear.tscn"),load("res://Tiles/Construcciones/Hidroelectrica.tscn"),load("res://Tiles/Construcciones/Central Carbon.tscn"),load("res://Tiles/Construcciones/Geotermal.tscn"),load("res://Tiles/Construcciones/Tesla.tscn"),load("res://Tiles/Construcciones/Energia Obscura.tscn"),load("res://Tiles/Construcciones/Casa Chica.tscn"),load("res://Tiles/Construcciones/Casa Mediana.tscn"),load("res://Tiles/Construcciones/Casa Grande.tscn"),load("res://Tiles/Construcciones/Residencia.tscn"),load("res://Tiles/Construcciones/Depa Chico.tscn"),load("res://Tiles/Construcciones/Depa Mediano.tscn"),load("res://Tiles/Construcciones/Depa Grande.tscn"),load("res://Tiles/Construcciones/Empresa.tscn"),load("res://Tiles/Construcciones/Industria.tscn"),load("res://Tiles/Construcciones/Modulo Atencion.tscn"),load("res://Tiles/Construcciones/Oficina.tscn"),load("res://Tiles/Construcciones/Sector.tscn"),load("res://Tiles/Construcciones/Divicion.tscn"),load("res://Tiles/Construcciones/Centro AC.tscn")]
var bloqueo = {"Aerogenerador":true,"Panel Solar":false,"Central Gas":false,"Reactor Nuclear":false,"Hidroelectrica":false,"Central Carbon":false,"Geotermal":false,"Tesla":false,"Energia Obscura":false,"Casa Chica":true,"Casa Mediana":false,"Casa Grande":false,"Residencia":false,"Depa Chico":false,"Depa Mediano":false,"Depa Grande":false,"Empresa":false,"Industria":false,"Modulo Atencion":true,"Oficina":false,"Sector":false, "Divicion":false,"Centro AC":false}
var MensajesAyuda = ["Genera energia contruye plantas  de energia  que podras vender para construir nuevas  tecnologias.","La  energia se genera a partir  de la contruccion de generadores.","Los puntos de investigacion  se generan a partir de la construccion de  centros de investigacion","El dinero se genera apartir de  la venta  de energia","Cada vez que se sube de nivel podras seguir adquiriendo mejor tecnologia, mejores centros de investigacion y asi subir tu produccion de energia"]
var Eliminar = [load("res://Tiles/Construcciones/Delate.tscn")]
var Replace = [load("res://Tiles/Construcciones/Replace.tscn")]
var MensajesObjetivos = ["Desbloquear 5 Construcciones Obten 1000 Unidades de Dinero","Generar 1000 Puntos de Investigacion y obten 1000 puntos mas","Generar $20,000.00 mx para obtener el doble ","Generar 1000 unidades de energia por minuto obten 500 puntos de energia y 500 puntos de investigacion","Desbloquear una zona nueva Obten 5k unidades de dinero"]
var ImagenesObjetivos = [load("res://Graphics/Objetivos Imagenes/objetivo1.tscn"),load("res://Graphics/Objetivos Imagenes/objetivo2.tscn"),load("res://Graphics/Objetivos Imagenes/objetivo3.tscn"),load("res://Graphics/Objetivos Imagenes/objetivo4.tscn"),load("res://Graphics/Objetivos Imagenes/objetivo5.tscn")]
var EstadoObjetivos = ["NO CUMPLIDO","NO CUMPLIDO","NO CUMPLIDO","NO CUMPLIDO","NO CUMPLIDO"]
var ImagenesAyuda = [load("res://Graphics/Ayuda Imagenes/Ayuda1.tscn"),load("res://Graphics/Ayuda Imagenes/Ayuda2.tscn"),load("res://Graphics/Ayuda Imagenes/Ayuda3.tscn"),load("res://Graphics/Ayuda Imagenes/Ayuda4.tscn"),load("res://Graphics/Ayuda Imagenes/Ayuda5.tscn")]
var mouse = null
var posible = false
func _ready():
	load_game()
func save_game():
	var save_file = File.new()
	save_file.open(save_filename, File.WRITE)
	var saved_nodes = get_tree().get_nodes_in_group("Saved")
	for node in saved_nodes:
		if node.filename.empty():
			break
		var node_details = node.get_save_stats()
		save_file.store_line(to_json(node_details))
	save_file.close()
func load_game():
	var save_file = File.new()
	if not save_file.file_exists(save_filename):
		return
	var saved_nodes = get_tree().get_nodes_in_group("Saved")
	for node in saved_nodes:
		node.queue_free()
	save_file.open(save_filename,File.READ)
	while save_file.get_position() < save_file.get_len():
		var node_data = parse_json(save_file.get_line())
		var new_obj = load(node_data.filename).instance()
		get_node(node_data.parent).call_deferred('add_child',new_obj)
		new_obj.load_save_stats(node_data)
