extends Node2D

# Solo definimos el TIPO de dato. 
# Las rutas las arrastraremos en el editor.
@export var cliente_escena: PackedScene 
@export var texturas_clientes: Array[Texture2D] 

@onready var spawn_timer = $SpawTimer
@onready var punto_spawn = $PosicionSpawn

func _ready():
	# Es buena idea verificar que el Timer exista para evitar errores
	if spawn_timer:
		spawn_timer.timeout.connect(_on_spawn_timer_timeout)

func _on_spawn_timer_timeout():
	# Verificamos que hayamos asignado la escena en el inspector
	if not cliente_escena:
		print("¡Error! No has asignado la escena del cliente en el Inspector")
		return
	var nuevo_cliente = cliente_escena.instantiate()
	add_child(nuevo_cliente)
	nuevo_cliente.global_position = punto_spawn.global_position
	
	
	# Pasamos el array de texturas al cliente
	nuevo_cliente.configurar_cliente(texturas_clientes)
	
	spawn_timer.wait_time = randf_range(5.0, 12.0)
	
