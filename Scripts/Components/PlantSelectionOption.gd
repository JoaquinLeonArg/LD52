extends UIElement

const IDLE_MODULATE = Color(0.6, 0.6, 0.6, 1)
const HOVER_MODULATE = Color(1, 1, 1, 1)
const DISABLED_MODULATE = Color(0.4, 0.4, 0.4, 1)
const HOVER_DURATION = 0.2
const X_COST_START = 200
const X_HARVEST_START = 232
const X_OFFSET = 14

var plant_cost_item_scene = preload("res://Components/PlantCostItem.tscn")
var plant_data


func set_plant(plant: Plants.Plant):
	self.plant_data = plant
	var i = 0
	for resource in plant.plant_costs:
		var cost = plant.plant_costs[resource]
		var plant_cost_item = plant_cost_item_scene.instance()
		plant_cost_item.position = Vector2(X_COST_START - X_OFFSET * i, 16)
		plant_cost_item.set_values(resource, cost)
		self.add_child(plant_cost_item)
		i += 1
	i = 0
	for resource in plant.harvest_resources:
		var cost = plant.harvest_resources[resource]
		var plant_cost_item = plant_cost_item_scene.instance()
		plant_cost_item.position = Vector2(X_HARVEST_START + X_OFFSET * i, 16)
		plant_cost_item.set_values(resource, cost)
		self.add_child(plant_cost_item)
		i += 1
	$Name.bbcode_text = plant.name
	$Time.bbcode_text = str(plant.grow_time)
	if not self.plant_data.can_be_planted():
		self.modulate = DISABLED_MODULATE


func on_select():
	.on_select()
	if not Global.selected_plot:
		print_debug("Tried to plant in null plot")
		return
	if not self.plant_data.can_be_planted():
		return
	self.plant_data.plant()
	Global.selected_plot.plant(self.plant_data)


func on_deselect():
	.on_deselect()


# Animations
func mouse_entered():
	if not self.plant_data.can_be_planted():
		return
	.mouse_entered()


func animate_hover():
	var tween = get_tree().create_tween()
	tween.tween_property($Background, "self_modulate", HOVER_MODULATE, HOVER_DURATION)


func animate_dehover():
	var tween = get_tree().create_tween()
	tween.tween_property($Background, "self_modulate", IDLE_MODULATE, HOVER_DURATION)
