extends Sprite2D

var speed
func _ready():
	speed = get_node("../Enemy").speed

func _process(delta):
	get_parent().progress += (speed*delta)

	if get_node("../Enemy").health <= 0:
		self.queue_free()
		get_node("/root/PlayerVar").money += get_node("../Enemy").money
