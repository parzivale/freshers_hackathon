extends Node2D

@export var damage = 10
@export var speed = 10

@export var target: Vector2 = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var collider = get_node("Area2D")
	collider.area_entered.connect(check_and_do_damage)
	var timer = get_node("Timer")
	timer.timeout.connect(despawn)

func check_and_do_damage(area):
	if area.get_node_or_null("../Enemy"):
		area.get_node_or_null("../Enemy").health -= 1
		

func despawn():
	self.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var ba = (target).normalized() 
	
	position += ba * speed
	$Sprite2D.flip_h = ba.x > 0
	if (target.distance_to(position) < 3): self.queue_free()
	
