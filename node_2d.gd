extends Node2D

var placer = preload("placer.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var pla = placer.instantiate()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
