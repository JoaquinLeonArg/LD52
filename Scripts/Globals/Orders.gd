extends Node

var orders_ui
var orders
var current_order
var fulfilled_orders


class Order:
	var potion_requirements
	var time_remaining

	func _init(_potion_requirements, _time_remaining):
		self.potion_requirements = _potion_requirements
		self.time_remaining = _time_remaining

	func advance_day():
		if self.time_remaining == 0:
			Global.game_over(self)
		else:
			self.time_remaining -= 1

	func meets_condition(potion):
		for condition in self.potion_requirements:
			if not condition.meets_condition(potion):
				return false
		return true

	func fulfill():
		Orders.fulfilled_order()
		Orders.orders.erase(self)
		Orders.orders_ui.remove_order(self)


class PotionRequirement:
	func meets_condition(_potion):
		return true

	func icon():
		return null

	func repr():
		return null


class MinimumAmountRequirement:
	extends PotionRequirement

	const REPR_FORMAT = "%s+"

	var resource
	var amount

	func _init(_resource, _amount):
		self.resource = _resource
		self.amount = _amount

	func meets_condition(potion):
		return potion.resources[self.resource] >= self.amount

	func icon():
		return Resources.RESOURCE_ICONS[self.resource]

	func repr():
		return self.REPR_FORMAT % self.amount


func reset():
	self.orders_ui = get_tree().current_scene.get_node("Orders")
	self.orders = []
	self.fulfilled_orders = 0


func order_amount(day):
	# 1, 0, 1, 0 , 2, 2, 3, 3, 3 ...
	if day == 2 or day == 4:
		return 0
	return [3, 1 + int(day / 3)].min()


func advance_day():
	for order in self.orders:
		order.advance_day()
	for _order in self.order_amount(Global.current_day):
		if self.orders.size() + self.fulfilled_orders >= 20:
			return
		var remaining_resources = [
			Resources.ResourceType.SOUL_GRAY,
			Resources.ResourceType.SOUL_RED,
			Resources.ResourceType.SOUL_BLUE,
			Resources.ResourceType.SOUL_PINK,
			Resources.ResourceType.SOUL_YELLOW,
		]
		var requirements = []
		for i in 1 + randi() % [5, 1 + int(Global.current_day / 3)].min():
			var resource_index = randi() % len(remaining_resources)
			var resource = remaining_resources.pop_at(resource_index)
			var amount = 1 + (randi() % 2) + int(Global.current_day / 3)
			requirements.append(MinimumAmountRequirement.new(resource, amount))
		var time_remaining = 4 - [2, int(Global.current_day / 3)].max()
		var order = Order.new(requirements, time_remaining)
		self.new_order(order)


func new_order(order):
	self.orders.append(order)
	self.orders_ui.new_order(order)


func fulfilled_order():
	self.fulfilled_orders += 1
	if self.fulfilled_orders >= 20:
		Global.win()
