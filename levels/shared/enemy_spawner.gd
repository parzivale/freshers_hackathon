extends Node2D

var Enemies = {
	1: preload("res://enemies/basic_snake/basic_snake.tscn"),
	35: preload("res://enemies/king_cobra_snake/king_cobra_snake.tscn"),
	4: preload("res://enemies/rattle_snake/rattle_snake.tscn"),
	5: preload("res://enemies/sharp_snake/sharp_snake.tscn"),
	10: preload("res://enemies/sus_snake/sus_snake.tscn"),
	3: preload("res://enemies/thunder_snake/thunder_snake.tscn"),
}
var spawnRate = 1
var wavePower = 9
var n = wavePower

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	$"Spawn Rate".wait_time = spawnRate
	await $"Spawn Rate".timeout.connect(spawn)
	await $"Wave Rate".timeout.connect(startWave)

func spawn():
	# todo put the enemy wave algorithm here using n.
	var enemy = null 
	
	if n >= 35:
		enemy = Enemies[35]
		n -= 35
	elif n >= 10:
		enemy = Enemies[10]
		n -= 9
	elif n >= 5:
		enemy = Enemies[5]
		n -= 1
	elif n >= 4:
		enemy = Enemies[4]
		n -= 2
	elif n >= 3:
		enemy = Enemies[3]
		n -= 1
	elif n > 0:
		enemy = Enemies[1]
		n -= 0.5
	else:
		return # wait until next wave
	
	var new = enemy.instantiate()
	get_node("Path2D").add_child(new)
	
func startWave():
	get_node("/root/PlayerVar").wave += 1
	wavePower += 5
	n = wavePower
	
