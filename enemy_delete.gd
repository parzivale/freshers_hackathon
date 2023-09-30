extends Area2D


func _ready():
	area_entered.connect(despawn)
	
func despawn(area):
	get_parent().queue_free()
