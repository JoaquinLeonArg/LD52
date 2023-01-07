extends Node2D

export(PackedScene) var transition_scene: PackedScene

func _ready():
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC)
	$CreatedWith.modulate.a = 0.0
	$GodotLogo.modulate.a = 0.0
	tween.tween_property($CreatedWith, "modulate:a", 1.0, 1.0)
	tween.tween_property($GodotLogo, "modulate:a", 1.0, 1.0)
	tween.tween_callback(self, "transition").set_delay(2.0)

func transition():
	var _err = get_tree().change_scene_to(transition_scene)
