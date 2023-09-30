extends Node2D

@export var path: Path2D

# Called when the node enters the scene tree for the first time.
func _ready():
	set_position(path.curve.get_point_position(path.curve.point_count-1))

func _process(delta):
	var bodies =  get_node("Area2D").get_overlapping_bodies()
	for i in bodies:
		if i.get_node("Enemy"):
			i.queue_free()
