extends Control

const PLOT_COUNT_H = 4
const PLOT_COUNT_V = 3
const PLOT_SEP_H = 10
const PLOT_SEP_V = 10
const PLOT_WIDTH = 96
const PLOT_HEIGHT = 64

onready var farm_plot_scene = preload("res://Components/FarmPlotComponent.tscn")

func _ready():
	for x in range(PLOT_COUNT_H):
		for y in range(PLOT_COUNT_V):
			var farm_plot = farm_plot_scene.instance()
			farm_plot.rect_position = Vector2(x*(PLOT_WIDTH+PLOT_SEP_H), y*(PLOT_HEIGHT+PLOT_SEP_V))
			self.add_child(farm_plot)
			
