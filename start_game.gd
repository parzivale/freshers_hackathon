extends Control

func _ready():
	self.pressed.connect(start_game)

func start_game():
	get_tree().change_scene_to_file("res://levels/level 1/level1.tscn")
