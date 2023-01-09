extends Node2D

const SCROLL_SPEED = 100


func _process(delta: float):
	$CreditsText.rect_position.y -= SCROLL_SPEED * delta


func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_ESCAPE:
			get_tree().change_scene("res://Scenes/MainMenu.tscn")
