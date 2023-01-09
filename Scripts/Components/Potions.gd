extends Control


func _ready():
	if $CloseButton.connect("pressed", self, "toggle") != OK:
		print_debug("Failed to connect")


func toggle():
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC)
	if Inventory.active:
		tween.tween_property(self, "rect_global_position:y", 1200.0, 0.5)
		Inventory.active = false
	else:
		tween.tween_property(self, "rect_global_position:y", 380.0, 0.5)
		for slot in $Slots.get_children():
			slot.reset()
		for item_index in Inventory.potions.size():
			var item = Inventory.potions[item_index]
			$Slots.get_child(item_index).set_potion(item)
		Inventory.active = true
