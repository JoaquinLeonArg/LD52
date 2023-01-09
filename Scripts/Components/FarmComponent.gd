extends Control

const PLOT_COUNT_H = 4
const PLOT_COUNT_V = 3
const PLOT_SEP_H = 0
const PLOT_SEP_V = 0
const PLOT_WIDTH = 128
const PLOT_HEIGHT = 96

onready var farm_plot_scene = preload("res://Components/FarmPlotComponent.tscn")


func _ready():
	var overall_offest = Vector2(PLOT_COUNT_H * PLOT_WIDTH / 2.0, PLOT_COUNT_V * PLOT_HEIGHT / 2.0)
	for x in range(PLOT_COUNT_H):
		for y in range(PLOT_COUNT_V):
			var farm_plot = farm_plot_scene.instance()
			farm_plot.rect_position = (
				Vector2(x * (PLOT_WIDTH + PLOT_SEP_H), y * (PLOT_HEIGHT + PLOT_SEP_V))
				- overall_offest
			)
			self.add_child(farm_plot)


func next_day():
	for plant in self.get_children():
		plant.next_day()
