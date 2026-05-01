extends Node
@export var possibleClothes = ["res://resources/clothes/whiteSock.tres","res://resources/clothes/whiteSkirt.tres","res://resources/clothes/whiteShirt.tres","res://resources/clothes/whitePants.tres","res://resources/clothes/underwear.tres","res://resources/clothes/santaHat.tres","res://resources/clothes/redSock.tres","res://resources/clothes/redSkirt.tres","res://resources/clothes/redShirt.tres","res://resources/clothes/redPants.tres","res://resources/clothes/hat.tres","res://resources/clothes/blackSock.tres","res://resources/clothes/blackSkirt.tres","res://resources/clothes/blackShirt.tres","res://resources/clothes/blackPants.tres"]


func generateClothes():
	var clothesArray = []
	var pool = possibleClothes.duplicate()
	pool.shuffle()
	var amount = randi_range(3, pool.size())
	for i in range(amount):
		clothesArray.append(load(pool[i]))
	return clothesArray
