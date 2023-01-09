extends UIElement

export(String) var title
export(String) var description
export(Resource) var icon 

onready var base_x = self.rect_position.x
var disabled

func _process(_delta):
	if self.disabled:
		self.modulate = Color(0.5, 0.5, 0.5, 1.0)
	else:
		self.modulate = Color(1.0, 1.0, 1.0, 1.0)

func _ready():
	$SoulName.bbcode_text = self.title
	$SoulDescription.bbcode_text = self.description
	$Icon.texture = self.icon
	self.disabled = false
	._ready()


func animate_hover():
	if self.base_x:
		var tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(self, "rect_position:x", self.base_x + 5.0, 0.4)


func animate_dehover():
	if self.base_x:
		var tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(self, "rect_position:x", self.base_x, 0.4)
