extends TextureButton

export(String) var text

const IDLE_MODULATE = Color(0.6, 0.6, 0.6, 1)
const HOVER_MODULATE = Color(1, 1, 1, 1)
const HOVER_DURATION = 0.2
const CENTER_FORMAT = "[center]%s[/center]"

# Animations

func _ready():
	$Text.bbcode_text = CENTER_FORMAT % self.text

func _pressed():
	$Click.play()

func animate_hover():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "self_modulate", HOVER_MODULATE, HOVER_DURATION)


func animate_dehover():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "self_modulate", IDLE_MODULATE, HOVER_DURATION)
