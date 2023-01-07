extends Node


class Plant:
	var plant_name
	var plant_costs
	var harvest_resources
	var grow_time
	var animation_scene

	func _init(
		_plant_name: String,
		_plant_costs: Dictionary,
		_harvest_resources: Dictionary,
		_grow_time: int,
		_animation_scene: PackedScene
	):
		self.plant_name = _plant_name
		self.plant_costs = _plant_costs
		self.harvest_resources = _harvest_resources
		self.grow_time = _grow_time
		self.animation_scene = _animation_scene

	func can_be_planted():
		for resource_type in self.plant_costs:
			var amount = self.plant_costs[resource_type]
			if Resources.resources[resource_type] < amount:
				return false
		return true

	func plant():
		if not self.can_be_planted():
			print_debug("Not enough resources to plant")
			return
		for resource_type in self.plant_costs:
			var amount = self.plant_costs[resource_type]
			Resources.consume(resource_type, amount)


func reset():
	self.plant_data = [
		Plant.new(
			"Basic Bitch",
			{
				Resources.ResourceType.SOUL_GRAY: 2,
			},
			{
				Resources.ResourceType.SOUL_GRAY: 4,
				Resources.ResourceType.SOUL_RED: 3,
			},
			1,
			load("res://Components/Plants/PlantBasic.tscn")
		),
		Plant.new(
			"Rainbow Weed",
			{
				Resources.ResourceType.SOUL_GRAY: 1,
				Resources.ResourceType.SOUL_RED: 1,
				Resources.ResourceType.SOUL_BLUE: 1,
				Resources.ResourceType.SOUL_YELLOW: 1,
				Resources.ResourceType.SOUL_PINK: 1,
			},
			{
				Resources.ResourceType.SOUL_GRAY: 10,
			},
			1,
			load("res://Components/Plants/PlantBasic.tscn")
		)
	]
