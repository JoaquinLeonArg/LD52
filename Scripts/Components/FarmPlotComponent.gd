extends UIElement

const IDLE_MODULATE = Color(1, 1, 1, 1)
const HOVER_MODULATE = Color(0.8, 0.8, 0.8, 1)
const HOVER_DURATION = 0.2
const RIGHT_FORMAT = "[right]%s[/right]"

onready var plant_selection_popup_scene = preload("res://Components/PlantSelectionPopup.tscn")

var plant_selection_popup: Node = null
var plant_data
var remaining_days = 0
var animation

func _process(delta):
	$RemainingDays.bbcode_text = RIGHT_FORMAT % self.remaining_days
	if self.remaining_days > 0:
		$RemainingDays.visible = true
	else:
		$RemainingDays.visible = false

func on_select():
	if Cauldron.active or Inventory.active:
		return
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
	self.animation = _plant_data.animation_scene.instance()
	self.animation.position = $Position2D.position
	self.add_child(self.animation)
	self.plant_data = _plant_data
	self.remaining_days = self.plant_data.grow_time


func next_day():
	if self.remaining_days > 0:
		self.remaining_days -= 1
	if self.remaining_days == 0 and self.plant_data:
		self.plant_data.harvest()
		self.plant_data = null
		self.animation.queue_free()


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
