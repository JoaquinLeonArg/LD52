extends Node

var inventory
var potions
var active


func _ready():
	self.reset()


func reset():
	self.inventory = get_tree().current_scene.get_node("UIElements/Potions")
	#self.cauldron.rect_global_position.y = 800.0
	self.potions = []
	self.active = false


func toggle():
	self.inventory.toggle()
