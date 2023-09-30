extends Sprite2D

var pos = Vector2(0, 0)
@export var tileSize = 64

var tower = preload("res://levels/shared/Tower.tscn")

func snap(number, by = tileSize):
	return ((round(number / (by)) * (by)))

func place():
	var new = tower.instantiate()
	get_parent().add_child(new)
	new.position.x = snap(pos.x)
	new.position.y = snap(pos.y)


# Called when the node enters the scene tree for the first time.
func _ready():
<<<<<<< HEAD
	var cells = get_node("../Placer").get_used_cells(0)
	
	
=======
>>>>>>> 9c4e37d (stuff)
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pos = get_global_mouse_position()
	self.position.x = snap(pos.x)
	self.position.y = snap(pos.y)
#	print(pos)


func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_P:
			place()

