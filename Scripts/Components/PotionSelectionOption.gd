extends UIElement

const IDLE_MODULATE = Color(0.6, 0.6, 0.6, 1)
const HOVER_MODULATE = Color(1, 1, 1, 1)
const HOVER_DURATION = 0.2
const X_COST_START = 240
const X_HARVEST_START = 232
const X_OFFSET = 14
const CENTER_FORMAT = "[center]%s[/center]"

var potion_cost_item_scene = preload("res://Components/PotionCostItem.tscn")
var potion_data


func set_potion(potion: Potions.Potion):
	self.potion_data = potion
	var i = 0
	for resource in potion.resources:
		var cost = potion.resources[resource]
		var potion_cost_item = potion_cost_item_scene.instance()
		potion_cost_item.rect_position = Vector2(X_COST_START + X_OFFSET * i, 16)
		potion_cost_item.get_node("Sprite").texture = load(Resources.RESOURCE_ICONS[resource])
		potion_cost_item.get_node("Cost").bbcode_text = CENTER_FORMAT % str(cost)
		self.add_child(potion_cost_item)
		i += 1
	$Name.bbcode_text = potion.name
	$Icon.texture = load(potion.icon)


func on_select():
	.on_select()
	if not Orders.current_order:
		print_debug("Tried to fulfill null order")
		return
	Inventory.potions.erase(self.potion_data)
	Orders.current_order.fulfill()


func on_deselect():
	.on_deselect()


# Animations


func animate_hover():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "self_modulate", HOVER_MODULATE, HOVER_DURATION)


func animate_dehover():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "self_modulate", IDLE_MODULATE, HOVER_DURATION)
