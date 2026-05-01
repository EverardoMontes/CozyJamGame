extends Sprite2D
var dragging = true
var color = ""

func setup(data):
	texture = load(data.sprite_path)
	color = data.color

func _process(delta):
	if dragging:
		print("dragging!")
		global_position = get_global_mouse_position()
	if Input.is_action_just_released("mouse_right_click"):
		dragging=false
		dropClothe()

func dropClothe():
	queue_free()
	return
	
