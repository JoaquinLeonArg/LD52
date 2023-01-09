extends Node2D

var monster_data = null
var animation = null


func set_monster_data(_monster_data, allies: Array, enemies: Array):
	self.monster_data = _monster_data
	self.animation = _monster_data.animation_scene.instance()
	self.add_child(animation)


func tick():
	self.monster_data.tick()
