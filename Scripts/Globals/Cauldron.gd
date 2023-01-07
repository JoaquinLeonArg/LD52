extends Node

var cauldron
var active


func _ready():
	self.reset()


func reset():
	self.cauldron = get_tree().current_scene.get_node("UIElements/Cauldron")


func toggle():
	var tween = get_tree().create_tween()
	if self.active:
		pass
	else:
		tween.tween_property(self.cauldron, "rect_global_position:y", 128)
