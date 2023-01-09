extends Node

var CAMERA_POSITIONS = {
	Global.Screen.FARM: Vector2(0.0, 0.0),
	Global.Screen.COMBAT: Vector2(1280.0, 0.0),
}

var camera = null


func reset():
	self.camera = get_tree().current_scene.get_node("Camera")


func move_to(screen: int):
	var tween = get_tree().create_tween()
	tween.tween_property(self.camera, "position", CAMERA_POSITIONS[screen], 0.5)
