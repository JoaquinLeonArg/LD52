extends Node

var potions_ui


class Potion:
	var names_list = [
		"Potion of the Spirit",
		"Flask of Distractions",
		"Elixir of Desires",
		"Brew of the Seer",
		"Draught of Anger",
		"Potion of Luck",
		"Potion of Lion's Roar",
		"Potion of Nimble Feet",
		"Tonic of Sleep Inducement",
		"Brew of Fire",
		"Draught of Immobilizing",
		"Philter of Healing",
		"Philter of Rejuvenation",
		"Phial of Growth",
		"Tonic of Earth",
		"Elixir of Ghostly Essence",
		"Philter of Godly Powers",
		"Draught of Pain Relief",
		"Flask of Honesty",
		"Draught of Dreamless Sleeps",
		"Phial of Lightning",
		"Elixir of Health",
		"Potion of Strength",
		"Flask of Fixation",
		"Elixir of Sunlight",
		"Flask of the Unknown",
		"Tonic of the Volcano",
		"Brew of the Volcano",
		"Philter of Haste",
		"Philter of Peace of Mind",
	]
	var icons_list = ["res://Resources/Image/pocion.png"]
	var resources
	var icon
	var name

	func _init(_resources):
		self.resources = _resources
		self.icon = self.icons_list[randi() % self.icons_list.size()]
		self.name = self.names_list[randi() % self.names_list.size()]


func reset():
	self.potions_ui = get_tree().current_scene.get_node("UIElements/Potions")
