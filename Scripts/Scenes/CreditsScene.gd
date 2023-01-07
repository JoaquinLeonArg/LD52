extends Node2D

const SCROLL_SPEED = 100

func _process(delta: float):
	$CreditsText.rect_position.y -= SCROLL_SPEED*delta
