extends Area2D


var ropa_sucia = [] # El array específico de este cliente
var posibles_prendas = ["Camisa", "Pantalon", "Calcetines", "Sueter"]

@onready var sprite = $"../Sprite2D"

func configurar_cliente(texturas_disponibles: Array):
	# 1. Elegir un diseño aleatorio
	sprite.texture = texturas_disponibles.pick_random()
	
	# 2. Generar su cesta de ropa aleatoria
	var cantidad_ropa = randi_range(1, 4)
	for i in range(cantidad_ropa):
		ropa_sucia.append(posibles_prendas.pick_random())
	
	print("Cliente llegó con: ", ropa_sucia)

# Función para cuando entregas la ropa o interactúas
func entregar_cesta():
	var cesta_para_lavadora = ropa_sucia.duplicate()
	ropa_sucia.clear()
	return cesta_para_lavadora
