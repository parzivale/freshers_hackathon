extends Label

func _process(delta):
	var content = str(get_node("/root/PlayerVar").money)
	text = content
