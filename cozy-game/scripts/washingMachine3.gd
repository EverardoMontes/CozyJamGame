extends Area2D
var items = []
var maximum_capacity = 4
var color = ""

func add_clothes(clothe):
	if color=="" and items.is_empty():
		color=clothe.color
		items.append(clothe)
	elif !items.size()>=maximum_capacity and color and clothe.color==color:
		items.append(clothe)
	else:
		print("Washing machine full!")

func remove_clothes():
	if !items.is_empty():
		items.pop_back()
	if items.is_empty():
		color=""
	else:
		print("Washing machine totally empty!")
