extends Control

const CENTER_FORMAT = "[center]%s[/center]"


func _process(_delta):
	$CauldronOptionGray.disabled = Resources.resources[Resources.ResourceType.SOUL_GRAY] == 0
	$CauldronOptionRed.disabled = Resources.resources[Resources.ResourceType.SOUL_RED] == 0
	$CauldronOptionBlue.disabled = Resources.resources[Resources.ResourceType.SOUL_BLUE] == 0
	$CauldronOptionPink.disabled = Resources.resources[Resources.ResourceType.SOUL_PINK] == 0
	$CauldronOptionYellow.disabled = Resources.resources[Resources.ResourceType.SOUL_YELLOW] == 0

	$GrayCount.bbcode_text = (
		CENTER_FORMAT
		% str(Cauldron.held_resources[Resources.ResourceType.SOUL_GRAY])
	)
	$BlueCount.bbcode_text = (
		CENTER_FORMAT
		% str(Cauldron.held_resources[Resources.ResourceType.SOUL_BLUE])
	)
	$RedCount.bbcode_text = (
		CENTER_FORMAT
		% str(Cauldron.held_resources[Resources.ResourceType.SOUL_RED])
	)
	$PinkCount.bbcode_text = (
		CENTER_FORMAT
		% str(Cauldron.held_resources[Resources.ResourceType.SOUL_PINK])
	)
	$YellowCount.bbcode_text = (
		CENTER_FORMAT
		% str(Cauldron.held_resources[Resources.ResourceType.SOUL_YELLOW])
	)


func _ready():
	$Cauldron/AnimationPlayer.play("Cauldron")
	if $CauldronOptionGray.connect("pressed", self, "gray_pressed") != OK:
		print_debug("Failed to connect")
	if $CauldronOptionRed.connect("pressed", self, "red_pressed") != OK:
		print_debug("Failed to connect")
	if $CauldronOptionBlue.connect("pressed", self, "blue_pressed") != OK:
		print_debug("Failed to connect")
	if $CauldronOptionPink.connect("pressed", self, "pink_pressed") != OK:
		print_debug("Failed to connect")
	if $CauldronOptionYellow.connect("pressed", self, "yellow_pressed") != OK:
		print_debug("Failed to connect")
	if $CraftButton.connect("pressed", self, "craft") != OK:
		print_debug("Failed to connect")
	if $CancelButton.connect("pressed", self, "toggle") != OK:
		print_debug("Failed to connect")


func toggle():
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC)
	if Cauldron.active:
		tween.tween_property(self, "rect_global_position:y", 1200.0, 0.5)
		Cauldron.active = false
	else:
		tween.tween_property(self, "rect_global_position:y", 380.0, 0.5)
		Cauldron.active = true


func add_souls(resource):
	Resources.consume(resource, 1)
	Cauldron.held_resources[resource] += 1


func craft():
	if Cauldron.generate_potion():
		$Sound.play()


func gray_pressed():
	if not $CauldronOptionGray.disabled:
		self.add_souls(Resources.ResourceType.SOUL_GRAY)


func red_pressed():
	if not $CauldronOptionRed.disabled:
		self.add_souls(Resources.ResourceType.SOUL_RED)


func blue_pressed():
	if not $CauldronOptionBlue.disabled:
		self.add_souls(Resources.ResourceType.SOUL_BLUE)


func pink_pressed():
	if not $CauldronOptionPink.disabled:
		self.add_souls(Resources.ResourceType.SOUL_PINK)


func yellow_pressed():
	if not $CauldronOptionYellow.disabled:
		self.add_souls(Resources.ResourceType.SOUL_YELLOW)
