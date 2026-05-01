extends Area2D
signal full_washing_machine
@export var maximum_capacity = 4
var color = ""
var items = []
var draggableFrom = false

func _init() -> void:
	color = ""
	items = []
	draggableFrom = false

func on_item_dropped(data):
	add_clothes(data)
	print(items)
	print(color)
	return

func add_clothes(clothe):
	if color=="" and items.is_empty():
		color=clothe.color
		items.append(clothe.resourcePath)
		clothe.queue_free()
	if color!="" and clothe.color!=color:
		print("Wrong color! you cant mix colors on a washing machine!")
		clothe.queue_free()
		ClothesBasket.clothes.append(load(clothe.resourcePath))
	if !items.size()>=maximum_capacity and color and clothe.color==color:
		items.append(clothe.resourcePath)
		clothe.queue_free()
	else:
		clothe.queue_free()
		full_washing_machine.emit()
		ClothesBasket.clothes.append(load(clothe.resourcePath))
		print("Washing machine full!")

func remove_clothes():
	if !items.is_empty():
		items.pop_back()
	if items.is_empty():
		color=""
	else:
		print("Washing machine totally empty!")
