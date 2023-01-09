extends TextureButton


func _process(delta):
	for order in Orders.orders:
		if order.time_remaining == 0:
			$Warning.visible = true
			return
	$Warning.visible = false


func _pressed():
	$Click.play()
	Plants.farm.next_day()
	Orders.advance_day()
	Global.current_day += 1
