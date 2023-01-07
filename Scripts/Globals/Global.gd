extends Node

var selected_plot = null
var ui_elements = null


func _ready():
	self.reset()


func reset():
	self.selected_plot = null
	self.ui_elements = get_tree().current_scene.get_node("UIElements")
	Resources.reset()
	Cauldron.reset()
