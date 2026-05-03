extends Node2D # O Area2D, según lo que uses

var ropa_sucia = []
var posibles_prendas = ["Camisa", "Pantalon", "Calcetines"]

@onready var sprite = $Sprite2D # Asegúrate de que el nodo se llame Sprite2D

func configurar_cliente(texturas_disponibles: Array):
	# Elegir diseño
	if texturas_disponibles.size() > 0:
		sprite.texture = texturas_disponibles.pick_random()
	
	# Crear ropa
	var cantidad = randi_range(1, 4)
	for i in range(cantidad):
		ropa_sucia.append(posibles_prendas.pick_random())
	
	print("Cliente configurado con ropa: ", ropa_sucia)
