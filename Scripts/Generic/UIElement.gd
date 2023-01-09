extends Control
class_name UIElement

var hover: bool = false
var selected: bool = false


func _ready():
	self.animate_dehover()
	self.animate_deselect()

	if not self.is_connected("mouse_entered", self, "mouse_entered"):
		var _err = self.connect("mouse_entered", self, "mouse_entered")
	if not self.is_connected("mouse_exited", self, "mouse_exited"):
		var _err = self.connect("mouse_exited", self, "mouse_exited")


func mouse_entered():
	self.hover = true
	self.animate_hover()


func mouse_exited():
	self.hover = false
	self.animate_dehover()


func _input(event):
	if event is InputEventMouseButton:
		if (
			event.button_index == BUTTON_LEFT
			and event.is_pressed()
			and self.hover
			and not self.selected
		):
			self.on_select()
			self.animate_select()
		elif event.button_index == BUTTON_LEFT and event.is_pressed() and self.selected:
			self.on_deselect()
			self.animate_deselect()


func animate_hover():
	pass


func animate_dehover():
	pass


func on_select():
	self.selected = true


func animate_select():
	pass


func on_deselect():
	self.selected = false


func animate_deselect():
	pass
