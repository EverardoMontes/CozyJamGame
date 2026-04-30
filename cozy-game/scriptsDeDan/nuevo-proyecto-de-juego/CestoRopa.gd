extends Area2D

var arrastrando: bool = false
var posicion_inicial: Vector2
var esta_sucia: bool = true # NUEVO: Nos dirá si se puede lavar o entregar

func _ready():
	posicion_inicial = global_position

# Detecta cuando haces clic JUSTO sobre el área
func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		arrastrando = true
		print("¡Clic detectado! Agarrando cesto...")

# Detecta cuando sueltas el clic en CUALQUIER PARTE de la pantalla
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		if arrastrando:
			arrastrando = false
			print("¡Cesto soltado!")
			verificar_soltado()

func _process(_delta):
	if arrastrando:
		global_position = get_global_mouse_position()

func verificar_soltado():
	var areas = get_overlapping_areas()
	var accion_realizada = false
	
	print("--- INTENTANDO SOLTAR CESTO ---")
	print("Cantidad de áreas que estoy tocando: ", areas.size())
	
	for area in areas:
		print("Tocando a: ", area.name)
		print("¿Está en grupo 'entrega'?: ", area.is_in_group("entrega"))
		print("¿La ropa está sucia (true) o limpia (false)?: ", esta_sucia)
		
		# CASO 1: Lavadora
		if area.is_in_group("lavadora") and esta_sucia and area.estado == area.Estado.VACIA:
			print("Éxito: Entró a la lavadora.")
			area.iniciar_lavado()
			accion_realizada = true
			queue_free()
			return
			
		# CASO 2: Zona de entrega
		elif area.is_in_group("entrega") and not esta_sucia:
			print("¡Pedido entregado! $$$")
			if area.has_method("recibir_entrega"):
				area.recibir_entrega()
			GameManager.ganar_dinero(20) 
			accion_realizada = true
			queue_free()
			return
			
	# Si no entró a ningún if, regresa a su lugar
	if not accion_realizada:
		print("Fallo: Regresando a la posición inicial.")
		var tween = create_tween()
		tween.tween_property(self, "global_position", posicion_inicial, 0.2).set_trans(Tween.TRANS_SINE)
