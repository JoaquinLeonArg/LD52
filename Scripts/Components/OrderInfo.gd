extends UIElement

const CENTER_FORMAT = "[center]%s[/center]"

var order_info_line_scene = preload("res://Components/OrderInfoLine.tscn")
var potion_selection_popup_scene = preload("res://Components/PotionSelectionPopup.tscn")
var order_info
var potion_selection_popup
var valid_characters = [
	"res://Resources/Image/cientifica-personaje.png",
	"res://Resources/Image/personaje-romer.png",
	"res://Resources/Image/samurai-personaje.png"
]


func _ready():
	._ready()
	$Character.texture = load(valid_characters[randi() % valid_characters.size()])


func set_order_info(_order_info):
	self.order_info = _order_info
	$TurnsRemaining.bbcode_text = CENTER_FORMAT % str(self.order_info.time_remaining)
	for requirement_index in self.order_info.potion_requirements.size():
		var requirement = self.order_info.potion_requirements[requirement_index]
		var order_info_line = self.order_info_line_scene.instance()
		order_info_line.rect_position = Vector2(64.0, 56.0 + 20.0 * requirement_index)
		order_info_line.get_node("Condition").bbcode_text = CENTER_FORMAT % requirement.repr()
		order_info_line.get_node("Symbol").texture = load(requirement.icon())
		self.add_child(order_info_line)

func update():
	$TurnsRemaining.bbcode_text = CENTER_FORMAT % str(self.order_info.time_remaining)

func on_select():
	.on_select()
	Orders.current_order = self.order_info
	self.potion_selection_popup = potion_selection_popup_scene.instance()
	Global.ui_elements.get_parent().add_child(self.potion_selection_popup)
	self.potion_selection_popup.rect_position = (
		self.rect_global_position
		- Vector2(self.rect_size.x / 2.0, -128.0)
	)


func on_deselect():
	.on_deselect()
	print("deselect")
	Orders.current_order = null

	if self.potion_selection_popup:
		self.potion_selection_popup.queue_free()
