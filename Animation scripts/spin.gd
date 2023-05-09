extends Control

var rotation_modifier = 0.03
var current_rotation = 1

func _process(delta):
	current_rotation += rotation_modifier
	set_rotation(current_rotation * delta)
