extends Sprite2D

var pos = Vector2(0, 0)
@export var tileSize = 64
var makeImage = false

var textureImgIndex = [
	"res://Tower Assets/Towers/Crow Tower.png",
	"res://Tower Assets/Towers/Eagle Tower.png",
	"res://Tower Assets/Towers/Hawk Tower.png",
	"res://Tower Assets/Towers/Owl Tower.png",
	"res://Tower Assets/Towers/Pigeon Tower.png"
]
var tower = preload("res://levels/shared/Tower.tscn")

func snap(number, by = tileSize):
	return round(number / (by)) * (by)

func place(index):
	var new = tower.instantiate()
	get_parent().add_child(new)
	new.position.x = snap(pos.x)
	new.position.y = snap(pos.y)
	
	new.get_node("Sprite2D").texture = self.texture
	print(pos)
	get_node("/root/PlayerVar").placeMode = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#var cells = get_node("../Placer").get_used_cells(0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	visible = get_node("/root/PlayerVar").placeMode
	
	if visible:
		if makeImage:
			var image = Image.load_from_file(textureImgIndex[get_node("/root/PlayerVar").buyIndex])
			self.texture = ImageTexture.create_from_image(image)
			makeImage = false
			
		pos = get_global_mouse_position()
		self.position.x = snap(pos.x)
		self.position.y = snap(pos.y)
	else:
		makeImage = true


func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and get_node("/root/PlayerVar").placeMode and event.keycode == KEY_P:
			place(get_node("/root/PlayerVar").buyIndex)
			print("TOWER DROPPED!!!!")
