extends ColorRect

const OPTION_HEIGHT = 32

var plant_selection_option_scene = preload("res://Components/PlantSelectionOption.tscn")


func _ready():
	var plants = Plants.plant_data
	self.rect_size.y = OPTION_HEIGHT * len(plants)
	for plant_index in plants.size():
		var plant = plants[plant_index]
		var plant_selection_option = plant_selection_option_scene.instance()
		plant_selection_option.set_plant(plant)
		plant_selection_option.rect_position.y = OPTION_HEIGHT * plant_index
		self.add_child(plant_selection_option)
