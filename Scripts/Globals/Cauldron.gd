extends Node

var cauldron
var active
var held_resources


func _ready():
	self.reset()


func reset():
	self.cauldron = get_tree().current_scene.get_node("UIElements/Cauldron")
	#self.cauldron.rect_global_position.y = 800.0
	self.empty_resources()
	self.active = false


func empty_resources():
	self.held_resources = {
		Resources.ResourceType.SOUL_GRAY: 0,
		Resources.ResourceType.SOUL_RED: 0,
		Resources.ResourceType.SOUL_BLUE: 0,
		Resources.ResourceType.SOUL_PINK: 0,
		Resources.ResourceType.SOUL_YELLOW: 0,
	}


func generate_potion():
	var resource_counts = [
		self.held_resources[Resources.ResourceType.SOUL_GRAY],
		self.held_resources[Resources.ResourceType.SOUL_BLUE],
		self.held_resources[Resources.ResourceType.SOUL_RED],
		self.held_resources[Resources.ResourceType.SOUL_PINK],
		self.held_resources[Resources.ResourceType.SOUL_YELLOW],
	]
	var some = false
	for res in resource_counts:
		if res > 0:
			some = true
	if not some:
		return false
	
	Inventory.potions.append(Potions.Potion.new(self.held_resources))
	self.empty_resources()
	return true


func toggle():
	self.cauldron.toggle()
