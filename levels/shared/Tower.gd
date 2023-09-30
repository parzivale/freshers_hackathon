extends Node2D

@export var cooldown = 0

var projectile = preload("res://levels/shared/Projectile.tscn")
var enemies = []
var timer = 0

func shoot():
	var path2d = get_parent().get_node("enemy_spawner").get_node("Path2D")
	var new = projectile.instantiate()

	if (len(enemies) > 0):

		var target = enemies[0]
		if weakref(target).get_ref():
			new.target = target.get_parent().position
			self.add_child(new)


func on_enter(enemy):
	if enemy.get_node_or_null("../Enemy"):
		enemies.append(enemy)

func on_exit(enemy):
	if enemy.get_node_or_null("../Enemy"):
		enemies.pop_front()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.area_entered.connect(on_enter)
	$Area2D.area_exited.connect(on_exit)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if (timer > cooldown):
		timer = 0
		shoot()
