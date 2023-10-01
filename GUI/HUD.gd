extends Control

var tween = get_tree().create_tween()

func show_label():
	tween.tween_property($Control, "position", Vector2())
	$Control.visible = true
	
func hide_label():
	$Control.visible = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.mouse_entered.connect(show_label)
	$ColorRect.mouse_exited.connect(hide_label)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pv = get_node("/root/PlayerVar")
	
	$Money.text = "Money: " + str(pv.money)
	$Health.text = "Health: " + str(pv.health)
	$Wave.text = "Wave " + str(pv.wave)
	pass
