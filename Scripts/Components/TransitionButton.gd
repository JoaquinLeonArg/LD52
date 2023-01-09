extends UIElement


func _process(_delta):
	if Global.screen == Global.Screen.COMBAT:
		$Arrow.flip_h = false
	elif Global.screen == Global.Screen.FARM:
		$Arrow.flip_h = true


func animate_hover():
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC).set_parallel(true)
	tween.tween_property(self, "modulate:a", 0.8, 0.4)
	if Global.screen == Global.Screen.COMBAT:
		tween.tween_property(self, "rect_position:x", 1258.0, 0.4)
	elif Global.screen == Global.Screen.FARM:
		tween.tween_property(self, "rect_position:x", 1238.0, 0.4)


func animate_dehover():
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC).set_parallel(true)
	tween.tween_property(self, "modulate:a", 0.5, 0.4)
	tween.tween_property(self, "rect_position:x", 1248.0, 0.4)


func on_select():
	Global.switch_screen()
	$TransitionSound.play()
