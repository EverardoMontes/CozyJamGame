extends Node
@export var possibleClothes = ["res://resources/clothes/whiteSock.tres","res://resources/clothes/whiteSkirt.tres","res://resources/clothes/whiteShirt.tres","res://resources/clothes/whitePants.tres","res://resources/clothes/underwear.tres","res://resources/clothes/santaHat.tres","res://resources/clothes/redSock.tres","res://resources/clothes/redSkirt.tres","res://resources/clothes/redShirt.tres","res://resources/clothes/redPants.tres","res://resources/clothes/hat.tres","res://resources/clothes/blackSock.tres","res://resources/clothes/blackSkirt.tres","res://resources/clothes/blackShirt.tres","res://resources/clothes/blackPants.tres"]


func generateClothes():
	var clothesArray = []
	for i in range(randi_range(3, possibleClothes.size())):
		clothesArray.append(load(possibleClothes.pick_random()))
	return clothesArray
