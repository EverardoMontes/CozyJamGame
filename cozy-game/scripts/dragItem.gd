extends Sprite2D
var dragging = true
var color = ""
var spritePath = ""
var resourcePath = ""
var creator_basket = null

func setup(data):
	texture = load(data.sprite_path)
	color = data.color
	spritePath = data.spritePath
	resourcePath = data.resourcePath

func _process(delta):
	if dragging:
		global_position = get_global_mouse_position()
	if Input.is_action_just_released("mouse_right_click"):
		dragging=false
		drop_clothe()

func drop_clothe():
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsPointQueryParameters2D.new()
	query.position = get_global_mouse_position()
	query.collide_with_areas = true
	query.collide_with_bodies = true    
	query.exclude = [self] 
	var result = space_state.intersect_point(query,1)
	if result.size() > 0:
		var receptor = result[0].collider
		print("Object detected: ", receptor.name)
		if receptor.has_method("on_item_dropped"):
			receptor.on_item_dropped(self)
			var itemSaved = receptor.on_item_dropped(self)
			if not itemSaved:
				return_to_basket()
			else:
				return_to_basket()
		else:
			return_to_basket()
	else:
		return_to_basket()

func return_to_basket():
	if creator_basket != null:
		var item_res = load(resourcePath)
		creator_basket.clothes.append(item_res)
		print("Devuelto a: " + creator_basket.name + ". Total: " + str(creator_basket.clothes.size()))
		queue_free()
