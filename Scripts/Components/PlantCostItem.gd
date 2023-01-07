extends Node2D

const FULL_FORMAT = "[color=%s][center]%s[/center][/color]"


func set_values(resource_type: int, amount: int):
	$Cost.bbcode_text = FULL_FORMAT % [Resources.RESOURCE_COLORS[resource_type], str(amount)]
