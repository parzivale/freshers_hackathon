extends Control

var name = "Random Upgrade"
var description = ""
var cost = 1
var effect: func = func(x): x * 2

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect/Label = name
	$ColorRect/Label2 = str(cost) + "Money"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
