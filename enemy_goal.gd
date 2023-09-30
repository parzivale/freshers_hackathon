extends Node2D

@export var path: Path2D

# Called when the node enters the scene tree for the first time.
func _ready():
	print(path.curve.get_point_position(path.curve.point_count-1))
	set_position(path.curve.get_point_position(path.curve.point_count-1))
