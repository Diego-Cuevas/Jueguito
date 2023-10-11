extends NinePatchRect

func _process(_delta):
	for i in GlobalVar.recursos:
		if i == get_name():
			$text.text = str(GlobalVar.recursos[i])
