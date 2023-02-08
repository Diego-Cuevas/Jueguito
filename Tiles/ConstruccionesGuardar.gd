extends Sprite

func _ready():
	pass # Replace with function body.
func get_save_stats():
	return{
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"x_pos" : position.x,
		"y_pos" : position.y
	}
func load_save_stats(stats):
	position = Vector2(stats.x_pos,stats.y_pos)
	
