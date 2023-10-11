extends NinePatchRect

func _process(_delta):
	for i in GlobalVar.recursosxm:
		if i == get_name():
			$text.text = str(GlobalVar.recursosxm[i])
