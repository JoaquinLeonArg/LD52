extends Node

enum ResourceType { SOUL_GRAY, SOUL_RED, SOUL_BLUE, SOUL_YELLOW, SOUL_PINK }

const RESOURCE_COLORS = {
	ResourceType.SOUL_GRAY: "#f5f8fa",
	ResourceType.SOUL_RED: "#de3c31",
	ResourceType.SOUL_BLUE: "#51a6f0",
	ResourceType.SOUL_YELLOW: "#edf067",
	ResourceType.SOUL_PINK: "#eb83dd",
}

const RESOURCE_NAMES = {
	ResourceType.SOUL_GRAY: "Gray",
	ResourceType.SOUL_RED: "Red",
	ResourceType.SOUL_BLUE: "Blue",
	ResourceType.SOUL_YELLOW: "Yellow",
	ResourceType.SOUL_PINK: "Pink",
}

var resources = null


func _ready():
	self.reset()


func reset():
	self.resources = {
		ResourceType.SOUL_GRAY: 10,
		ResourceType.SOUL_RED: 0,
		ResourceType.SOUL_BLUE: 0,
		ResourceType.SOUL_YELLOW: 0,
		ResourceType.SOUL_PINK: 0
	}


func consume(resource_type: int, amount: int):
	if self.resources[resource_type] < amount:
		print_debug("Not enough resource to consume")
		return
	self.resources[resource_type] -= amount
