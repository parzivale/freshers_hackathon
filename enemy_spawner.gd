extends Node2D

var Enemy = preload("res://enemy.tscn")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var timer = get_node("Timer")
	await timer.timeout.connect(spawn)
	
func spawn():
	var enemy = Enemy.instantiate()
	get_node("Path2D").add_child(enemy)
