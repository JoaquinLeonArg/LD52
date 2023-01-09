extends UIElement

var potion


func reset():
	if self.potion:
		self.potion = null
		$Potion.texture = null

func _process(_delta):
	if not self.potion:
		$Potion.texture = null

func set_potion(_potion):
	if not self.potion:
		self.potion = _potion
		$Potion.texture = load(self.potion.icon)


func animate_hover():
	if self.potion:
		Potions.potions_ui.get_node("Tooltip").visible = true
		Potions.potions_ui.get_node("Tooltip/Gray").bbcode_text = str(
			self.potion.resources[Resources.ResourceType.SOUL_GRAY]
		)
		Potions.potions_ui.get_node("Tooltip/Red").bbcode_text = str(
			self.potion.resources[Resources.ResourceType.SOUL_RED]
		)
		Potions.potions_ui.get_node("Tooltip/Blue").bbcode_text = str(
			self.potion.resources[Resources.ResourceType.SOUL_BLUE]
		)
		Potions.potions_ui.get_node("Tooltip/Pink").bbcode_text = str(
			self.potion.resources[Resources.ResourceType.SOUL_PINK]
		)
		Potions.potions_ui.get_node("Tooltip/Yellow").bbcode_text = str(
			self.potion.resources[Resources.ResourceType.SOUL_YELLOW]
		)


func animate_dehover():
	Potions.potions_ui.get_node("Tooltip").visible = false
