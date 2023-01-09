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
	ResourceType.SOUL_GRAY: "Bespalt",
	ResourceType.SOUL_RED: "Helthin",
	ResourceType.SOUL_BLUE: "Mithrite",
	ResourceType.SOUL_YELLOW: "Chroiyum",
	ResourceType.SOUL_PINK: "Xolyx",
}

const RESOURCE_ICONS = {
	ResourceType.SOUL_GRAY: "res://Resources/Image/Iconos/fantasma-gris-icono.png",
	ResourceType.SOUL_RED: "res://Resources/Image/Iconos/fantasma-naranja-icono.png",
	ResourceType.SOUL_BLUE: "res://Resources/Image/Iconos/fantasma-azul-icono.png",
	ResourceType.SOUL_YELLOW: "res://Resources/Image/Iconos/fantasma-amarillo-icono.png",
	ResourceType.SOUL_PINK: "res://Resources/Image/Iconos/fantasma-rosa-icono.png",
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


func gain(resource_type: int, amount: int):
	self.resources[resource_type] += amount
