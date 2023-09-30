extends Sprite2D


func _process(delta):
	get_parent().progress += (50*delta)
