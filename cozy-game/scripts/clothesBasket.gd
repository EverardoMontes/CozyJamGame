extends Area2D
var dragging: bool = false
var initialPosition: Vector2
var dirty: bool = true
var clothes = []

func _ready():
	clothes = ClothesGenerator.generateClothes()
	self.input_event.connect(_on_input_event)
	print("ropa creada")
	
func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("clicked basket")
		if clothes.size() > 0:
			print(clothes)
			print("clothes array size: "+str(clothes.size()))
			var data_prenda = clothes.pop_back()
			create_clothe_sprite(data_prenda)
			print("clothe created")
		else:
			print("basket is empty")
			
func create_clothe_sprite(data):
	var new_clothe = Sprite2D.new()
	new_clothe.texture = load(data.sprite_path)
	new_clothe.set_script(load("res://scripts/dragItem.gd"))
	new_clothe.color = data.color
	new_clothe.creator_basket = self
	new_clothe.spritePath = data.sprite_path
	new_clothe.resourcePath = data.resource_path
	get_parent().add_child(new_clothe)
	new_clothe.global_position = get_global_mouse_position()
