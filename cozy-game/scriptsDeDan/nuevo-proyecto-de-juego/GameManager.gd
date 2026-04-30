extends Node

signal dinero_actualizado(nuevo_valor)
signal comfy_actualizado(nuevo_valor)

var dinero: int = 0
var comfy_score: float = 50.0 # Va de 0 a 100

func ganar_dinero(cantidad: int):
	# Si el lugar es muy comfy, hay propina extra
	var multiplicador_propina = 1.0
	if comfy_score > 80.0:
		multiplicador_propina = 1.5
		
	dinero += int(cantidad * multiplicador_propina)
	dinero_actualizado.emit(dinero)

func cambiar_comfy(cantidad: float):
	comfy_score = clamp(comfy_score + cantidad, 0.0, 100.0)
	comfy_actualizado.emit(comfy_score)
