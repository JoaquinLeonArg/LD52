extends UIElement
class_name UIButton

const IDLE_MODULATE = Color(0.6, 0.6, 0.6, 1)
const HOVER_MODULATE = Color(1, 1, 1, 1)
const HOVER_DURATION = 0.2

# Animations


func animate_hover():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "self_modulate", HOVER_MODULATE, HOVER_DURATION)


func animate_dehover():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "self_modulate", IDLE_MODULATE, HOVER_DURATION)
