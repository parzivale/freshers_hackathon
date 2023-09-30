extends Sprite2D

var pos = Vector2(0, 0)
var snap = 128

func place():
	#var tower = get_node("Tower")
	#var new = tower.duplicate()
	#get_parent().add_child(new)
	#new.position.x = pos.x
	#new.position.y = pos.y
	print(pos)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pos = get_global_mouse_position()
	self.position.x = round(pos.x / snap) * snap
	self.position.y = round(pos.y / snap) * snap
#	print(pos)

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_P:
			place()
			print("TOWER DROPPED!!!!")
