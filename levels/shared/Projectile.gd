extends Node2D

@export var damage = 10
@export var speed = 20

@export var target: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = get_node("Timer")
	timer.timeout.connect(despawn)

func despawn():
	self.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var ba = (target).normalized() 
	position += ba * speed
	
	#if (target.distance_to(position) < 3): self.queue_free()
