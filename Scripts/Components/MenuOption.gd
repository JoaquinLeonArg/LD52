extends UIElement

export(String) var text
export(Resource) var icon

const CENTER_FORMAT = "[center]%s[/center]"


func on_select():
	.on_select()
	$Click.play()


func _ready():
	._ready()
	$Text.bbcode_text = CENTER_FORMAT % self.text
	$Icon.texture = self.icon


func animate_hover():
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "rect_position:x", -80.0, 0.3)


func animate_dehover():
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "rect_position:x", -136.0, 0.3)
