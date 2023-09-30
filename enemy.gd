extends Sprite2D

func _ready():
	pass

func _process(delta):
	get_parent().progress += (500*delta)
