extends Control

# todo replace with true cost lol
var costs = [436432, 643643, 3643643, 4364346, 4545252]
var debounce = false

func good_to_good():
	debounce = false

func show_shop():
	if !debounce:
		debounce = true
		var tween = get_tree().create_tween()
		tween.finished.connect(good_to_good)
		tween.tween_property($Control, "position", Vector2(0, 20), 0.3).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)
	
func hide_shop():
	if !debounce:
		debounce = true
		var tween = get_tree().create_tween()
		tween.finished.connect(good_to_good)
		tween.tween_property($Control, "position", Vector2(0, 100), 0.4).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)

func show_upgrades():
	if !debounce:
		debounce = true
		var tween = get_tree().create_tween()
		tween.finished.connect(good_to_good)
		tween.tween_property($Control2, "position", Vector2(200, 0), 0.4).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)

func hide_upgrades():
	if !debounce:
		debounce = true
		var tween = get_tree().create_tween()
		tween.finished.connect(good_to_good)
		tween.tween_property($Control2, "position", Vector2(0, 0), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)

func buy_tower(index):
	if get_node("/root/PlayerVar").money >= costs[index] and get_node("/root/PlayerVar").placeMode == false:
		get_node("/root/PlayerVar").money -= costs[index]
		get_node("/root/PlayerVar").placeMode = true
		get_node("/root/PlayerVar").buyIndex = index

# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/ItemList.item_selected.connect(buy_tower)
	#$ColorRect.mouse_entered.connect(show_label)
	#$ColorRect.mouse_exited.connect(hide_label)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pv = get_node("/root/PlayerVar")
	
	$Control2/Money.text = "Money: " + str(pv.money)
	$Control2/Health.text = "Health: " + str(pv.health)
	$Control/Wave.text = "Wave " + str(pv.wave)
	
	if pv.health <= 0:
		get_tree().change_scene_to_file("res://gameover.tscn")
	
	var pos = get_global_mouse_position()
	if pos.y > 150:
		show_shop()
	else:
		hide_shop()
		
	if pv.towerSelected != null:
		show_upgrades()
	else:
		hide_upgrades()
