extends Area2D

@onready var color_rect = $ColorRect
var color_original: Color

func _ready():
	color_original = color_rect.color

# Esta función la llamará el CestoRopa cuando se entregue con éxito
func recibir_entrega():
	# Hacemos un "parpadeo" brillante para dar feedback de éxito
	var tween = create_tween()
	tween.tween_property(color_rect, "color", Color(1.0, 1.0, 1.0), 0.1) # Se pone blanco rápido
	tween.tween_property(color_rect, "color", color_original, 0.2) # Vuelve a su color
