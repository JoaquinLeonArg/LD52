extends Node2D

var t = 0
var start_y


func _ready():
	self.start_y = $Sprite.position.y


func _process(delta):
	self.t += 1
	$Sprite.position.y = self.start_y + 16 * sin(self.t * 0.01)


func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_S:
			get_tree().change_scene("res://Scenes/GameScene.tscn")
			Global.reset()
		if event.scancode == KEY_T:
			get_tree().change_scene("res://Scenes/TutorialScene.tscn")
		if event.scancode == KEY_C:
			get_tree().change_scene("res://Scenes/CreditsScene.tscn")
