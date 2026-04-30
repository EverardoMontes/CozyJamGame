extends Area2D

enum Estado { VACIA, LAVANDO, TERMINADA }
var estado = Estado.VACIA
var cesto_escena = preload("res://CestoRopa.tscn")

@export var tiempo_lavado: float = 5.0
@export var pago_por_lavado: int = 20

@onready var timer = $Timer
@onready var sprite = $ColorRect

func _ready():
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timeout)

func iniciar_lavado():
	if estado == Estado.VACIA:
		estado = Estado.LAVANDO
		sprite.modulate = Color(0.5, 0.5, 1.0) # Feedback visual (se pone azul)
		timer.start(tiempo_lavado)
		# Aquí podrías reproducir el audio de zumbido relajante

func _on_timer_timeout():
	estado = Estado.TERMINADA
	sprite.modulate = Color(0.2, 0.8, 0.2) # Feedback visual (se pone verde)
	# Aquí podrías reproducir el sonido de ¡Ding!

func _input_event(_viewport, event, _shape_idx):
	# Si el jugador hace clic en la lavadora cuando ya terminó
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if estado == Estado.TERMINADA:
			entregar_ropa()

func entregar_ropa():
	estado = Estado.VACIA
	sprite.modulate = Color(1, 1, 1)
	
	var cesto_limpio = cesto_escena.instantiate()
	get_parent().add_child(cesto_limpio)
	
	# Le damos su posición nueva
	cesto_limpio.global_position = global_position + Vector2(0, 150)
	
	# ¡EL FIX MÁGICO! Actualizamos su "hogar" para que no vuele al (0,0)
	cesto_limpio.posicion_inicial = cesto_limpio.global_position
	
	# Le decimos que es ropa limpia
	cesto_limpio.esta_sucia = false 
	cesto_limpio.get_node("ColorRect").color = Color(0.9, 0.8, 0.2)
