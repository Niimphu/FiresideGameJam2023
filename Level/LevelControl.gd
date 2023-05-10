extends Node

onready var button_control = get_node("HUD/ButtonControl")
onready var current_level = get_node("Levels/TestLevel")
onready var identifiers = current_level.get_node("Identifiers")
onready var sprites = identifiers.get_children()

var is_dangerous: bool
var buttons

func _ready():
	for child in sprites:
		randomize()
		child.frame = randi() % child.hframes
	button_control.connect("safe", self, "_on_safe_pressed")
	button_control.connect("danger", self, "_on_danger_pressed")

func _on_safe_pressed():
	input_received(false)

func _on_danger_pressed():
	input_received(true)

func input_received(danger_was_pressed: bool):
	is_dangerous = identifiers.check_danger()
	if danger_was_pressed == is_dangerous:
		print("Nice one")
	else:
		print("You're a fool")
	if get_tree().reload_current_scene() != OK:
		print("Reload scene fail")



