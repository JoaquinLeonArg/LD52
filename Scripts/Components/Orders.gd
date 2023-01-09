extends Control

var order_info_scene = preload("res://Components/OrderInfo.tscn")


func _ready():
	pass


func _process(_delta):
	self.update_orders()


func new_order(order: Orders.Order):
	var order_info = self.order_info_scene.instance()
	order_info.set_order_info(order)
	var target_position = Vector2(
		196.0 + 96.0 * self.get_children().size(), 96.0 + 196.0 * (self.get_children().size() % 3)
	)
	order_info.rect_position = target_position - Vector2(128.0, 0.0)
	order_info.modulate.a = 0.0
	self.add_child(order_info)
	self.update_orders()


func remove_order(order):
	for order_info in self.get_children():
		if order_info.order_info == order:
			order_info.queue_free()
	self.update_orders()


func update_orders():
	for order_info_index in self.get_children().size():
		var order_info = self.get_children()[order_info_index]
		var target_position = Vector2(
			196.0 + 96.0 * order_info_index, 96.0 + 196.0 * (order_info_index % 3)
		)
		order_info.update()

		var tween = get_tree().create_tween().set_parallel(true)
		tween.tween_property(order_info, "rect_position", target_position, 0.5)
		tween.tween_property(order_info, "modulate:a", 1.0, 0.5)
