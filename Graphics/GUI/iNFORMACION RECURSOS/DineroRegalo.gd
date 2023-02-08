
extends NinePatchRect
func _process(delta):
	for i in GlobalVar.recursos:
		if i == get_name():
			$text.text = "1000"
