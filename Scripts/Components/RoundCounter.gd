extends UIElement

const RIGHT_FORMAT = "[right]%s / 20[/right]"


func _process(delta):
	$Count.bbcode_text = RIGHT_FORMAT % str(Orders.fulfilled_orders)


func animate_hover():
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC).set_parallel(true)
	tween.tween_property($Overlay, "position:x", 140.0, 0.4)


func animate_dehover():
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC).set_parallel(true)
	tween.tween_property($Overlay, "position:x", 120.0, 0.4)
