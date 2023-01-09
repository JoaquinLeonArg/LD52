extends Control


func _ready():
	if $Brew.connect("pressed", self, "cauldron_button_pressed") != OK:
		print_debug("Failed to connect")
	if $Potions.connect("pressed", self, "potions_button_pressed") != OK:
		print_debug("Failed to connect")


func cauldron_button_pressed():
	Cauldron.toggle()


func potions_button_pressed():
	get_tree().current_scene.get_node("UIElements/Potions").toggle()
