extends Node2D


func _ready():
	$Grown.visible = false
	$Seeds.visible = true
	$Seeds/AnimationPlayer.play("Idle")
