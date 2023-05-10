extends Control

export var rotation_modifier = 0.0005
var current_rotation = 1

func _process(_delta):
	current_rotation += rotation_modifier
	set_rotation(current_rotation)
