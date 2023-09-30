extends Node
@export var health = 100
@export var money = 0

func _process(delta):
	if health <=0:
		get_tree().change_scene_to_file("res://gameover.tscn")
