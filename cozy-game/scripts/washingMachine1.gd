extends Area2D
var washing_machine_clothes = 0
var maximum_capacity = 4

func add_clothes():
	if !washing_machine_clothes>=maximum_capacity:
		washing_machine_clothes+=1
	else:
		print("Washing machine full!")

func remove_clothes():
	if !washing_machine_clothes<=0:
		washing_machine_clothes-=1
	else:
		print("Washing machine totally empty!")
