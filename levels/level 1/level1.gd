extends Node2D

var HUD = preload("res://GUI/HUD.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var new = HUD.instantiate()
	new.position -= Vector2(580, 340)
	self.add_child(new)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
