extends UIElement

const IDLE_MODULATE = Color(0.6, 0.6, 0.6, 1)
const HOVER_MODULATE = Color(1, 1, 1, 1)
const HOVER_DURATION = 0.2

onready var plant_selection_popup_scene = preload("res://Components/PlantSelectionPopup.tscn")

var plant_selection_popup: Node = null
var plant_data = null


func on_select():
	.on_select()
	Global.selected_plot = self
	self.plant_selection_popup = plant_selection_popup_scene.instance()
	self.plant_selection_popup.rect_global_position = (
		self.rect_global_position
		+ Vector2(self.rect_size.x / 2, 64)
	)
	Global.ui_elements.add_child(self.plant_selection_popup)


func on_deselect():
	.on_deselect()
	Global.selected_plot = null

	if self.plant_selection_popup:
		self.plant_selection_popup.queue_free()


func plant(_plant_data: Plants.Plant):
	var animation = _plant_data.animation_scene.instance()
	animation.position = $Position2D.position
	self.add_child(animation)
	self.plant_data = _plant_data


# Animations


func animate_hover():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "self_modulate", HOVER_MODULATE, HOVER_DURATION)


func animate_dehover():
	var tween = get_tree().create_tween()
	if self.selected:
		tween.tween_property(self, "self_modulate", HOVER_MODULATE, HOVER_DURATION)
	else:
		tween.tween_property(self, "self_modulate", IDLE_MODULATE, HOVER_DURATION)


func animate_select():
	var tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property(self, "self_modulate", HOVER_MODULATE, HOVER_DURATION)
	tween.tween_property(self, "self_modulate", HOVER_MODULATE, HOVER_DURATION)


func animate_deselect():
	var tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property(self, "self_modulate:r", 1.0, HOVER_DURATION)
	if self.hover:
		tween.tween_property(self, "self_modulate", HOVER_MODULATE, HOVER_DURATION)
	else:
		tween.tween_property(self, "self_modulate", IDLE_MODULATE, HOVER_DURATION)
