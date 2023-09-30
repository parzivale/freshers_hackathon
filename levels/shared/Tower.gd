extends Node2D

@export var cooldown = 1

var projectile = preload("res://levels/shared/Projectile.tscn")
var enemies = []
var timer = 0

func shoot():
	var path2d = get_parent().get_node("enemy_spawner").get_node("Path2D")
	var new = projectile.instantiate()
	print(enemies)
	if (len(enemies) > 0):
		enemies.sort_custom(func(a, b): return a.position.distance_to(position) < b.position.distance_to(position))
		var target = enemies[0]
		
		new.target = target.position - position
		self.add_child(new)


func on_enter(enemy):
	enemies.append(enemy)
	pass

func on_exit(enemy):
	enemies.pop_back()
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.area_entered.connect(on_enter)
	$Area2D.area_exited.connect(on_exit)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if (timer > cooldown):
		timer = 0
		shoot()
