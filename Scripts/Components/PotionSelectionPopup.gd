extends Control

const OPTION_HEIGHT = 32

var potion_selection_option_scene = preload("res://Components/PotionSelectionOption.tscn")


func _ready():
	var potions = Inventory.potions
	var valid_potions = []
	for potion in potions:
		if Orders.current_order.meets_condition(potion):
			valid_potions.append(potion)
	self.rect_size.y = OPTION_HEIGHT * len(valid_potions)
	for potion_index in valid_potions.size():
		var potion = valid_potions[potion_index]
		var potion_selection_option = potion_selection_option_scene.instance()
		potion_selection_option.set_potion(potion)
		potion_selection_option.rect_position.y = OPTION_HEIGHT * potion_index
		self.add_child(potion_selection_option)
