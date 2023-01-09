extends Node2D

onready var nodes = [$Step1, $Step2, $Step3, $Step4, $Step5, $Step6]
var current = 0


func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.scancode == KEY_RIGHT and current < nodes.size() - 1:
			nodes[current].visible = false
			current += 1
			nodes[current].visible = true
		if event.scancode == KEY_LEFT and current > 0:
			nodes[current].visible = false
			current -= 1
			nodes[current].visible = true
		if event.scancode == KEY_ESCAPE:
			get_tree().change_scene("res://Scenes/MainMenu.tscn")
