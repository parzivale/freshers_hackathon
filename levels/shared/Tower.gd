extends Node2D

@export var cooldown = 0.5
var tower_name = "Crow Tower"
var first_snake = preload("res://enemies_sprites/Thunder Snake.png")
var projectile = preload("res://levels/shared/Projectile.tscn")
var enemies = []
var timer = 0

func shoot():
	if (len(enemies) > 0):
		var target = enemies[0]
		if weakref(target).get_ref():
			var new = projectile.instantiate()
			new.target = target.get_parent().position
			self.add_child(new)
		else:
			enemies.remove_at(0)


func on_enter(enemy):
	if enemy.get_node_or_null("../Enemy"):
		print(enemy)
		enemies.append(enemy)

func on_exit(enemy):
	if enemy.get_node_or_null("../Enemy"):
		if len(enemies) > 0: 
			enemies.pop_front()
		
func show_label():
	$RichTextLabel.visible = true
	
func hide_label():
	$RichTextLabel.visible = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.area_entered.connect(on_enter)
	$Area2D.area_exited.connect(on_exit)
	$TextureRect.mouse_entered.connect(show_label)
	$TextureRect.mouse_exited.connect(hide_label)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	
	if (timer > cooldown):
		timer = 0
		shoot()
