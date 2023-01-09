extends Node

enum Screen { COMBAT, FARM }

var selected_plot
var screen
var ui_elements
var current_day

var win_scene = preload("res://Components/Win.tscn")
var game_over_scene = preload("res://Components/GameOver.tscn")


func _ready():
	self.reset()


func reset():
	randomize()
	self.selected_plot = null
	self.screen = Screen.FARM
	self.current_day = 1
	self.ui_elements = get_tree().current_scene.get_node("UIElements")
	Potions.reset()
	Resources.reset()
	Plants.reset()
	Cauldron.reset()
	Orders.reset()
	GameCamera.reset()


func switch_screen():
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_QUAD)
	if self.screen == Screen.COMBAT:
		# Moving to farm
		# Leaving
		# Entering
		tween.tween_property(
			self.ui_elements.get_node("ResourcesComponent"), "rect_position:y", 32.0, 0.3
		)
		self.screen = Screen.FARM
	elif self.screen == Screen.FARM:
		# Moving to combat
		# Leaving
		tween.tween_property(
			self.ui_elements.get_node("ResourcesComponent"), "rect_position:y", -256.0, 0.3
		)
		# Entering
		self.screen = Screen.COMBAT
	GameCamera.move_to(self.screen)


func win():
	self.ui_elements.add_child(self.win_scene.instance())


func game_over(_order):
	self.ui_elements.add_child(self.game_over_scene.instance())
