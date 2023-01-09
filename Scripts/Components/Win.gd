extends Control


func _ready():
	self.modulate.a = 0.0
	var tween = get_tree().create_tween()

	tween.tween_property(self, "modulate:a", 0.8, 1.0)
	yield(get_tree().create_timer(3.0), "timeout")
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
