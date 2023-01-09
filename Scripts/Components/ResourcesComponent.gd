extends Control

const RIGHT_FORMAT = "[right]%s[/right]"
const COLOR_FORMAT = "[color=%s]%s[/color]"


func _ready():
	$GraySoulName.bbcode_text = (
		COLOR_FORMAT
		% [
			Resources.RESOURCE_COLORS[Resources.ResourceType.SOUL_GRAY],
			Resources.RESOURCE_NAMES[Resources.ResourceType.SOUL_GRAY]
		]
	)
	$RedSoulName.bbcode_text = (
		COLOR_FORMAT
		% [
			Resources.RESOURCE_COLORS[Resources.ResourceType.SOUL_RED],
			Resources.RESOURCE_NAMES[Resources.ResourceType.SOUL_RED]
		]
	)
	$BlueSoulName.bbcode_text = (
		COLOR_FORMAT
		% [
			Resources.RESOURCE_COLORS[Resources.ResourceType.SOUL_BLUE],
			Resources.RESOURCE_NAMES[Resources.ResourceType.SOUL_BLUE]
		]
	)
	$YellowSoulName.bbcode_text = (
		COLOR_FORMAT
		% [
			Resources.RESOURCE_COLORS[Resources.ResourceType.SOUL_YELLOW],
			Resources.RESOURCE_NAMES[Resources.ResourceType.SOUL_YELLOW]
		]
	)
	$PinkSoulName.bbcode_text = (
		COLOR_FORMAT
		% [
			Resources.RESOURCE_COLORS[Resources.ResourceType.SOUL_PINK],
			Resources.RESOURCE_NAMES[Resources.ResourceType.SOUL_PINK]
		]
	)


func _process(_delta):
	$GraySoulCount.bbcode_text = (
		RIGHT_FORMAT
		% str(Resources.resources[Resources.ResourceType.SOUL_GRAY])
	)
	$RedSoulCount.bbcode_text = (
		RIGHT_FORMAT
		% str(Resources.resources[Resources.ResourceType.SOUL_RED])
	)
	$BlueSoulCount.bbcode_text = (
		RIGHT_FORMAT
		% str(Resources.resources[Resources.ResourceType.SOUL_BLUE])
	)
	$YellowSoulCount.bbcode_text = (
		RIGHT_FORMAT
		% str(Resources.resources[Resources.ResourceType.SOUL_YELLOW])
	)
	$PinkSoulCount.bbcode_text = (
		RIGHT_FORMAT
		% str(Resources.resources[Resources.ResourceType.SOUL_PINK])
	)
