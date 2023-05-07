extends Node

onready var button_control = load("res://GuidebookPrototype/ButtonControl.tscn")
onready var sprites = get_children()
onready var reload_delay = get_parent().get_node("ReloadTimer")

var is_dangerous: bool
var buttons

func _ready():
	for child in sprites:
		randomize()
		child.frame = randi() % child.hframes
	buttons = button_control.instance()
	buttons.set_name("ButtonControl")
	add_child(buttons)
	buttons.connect("safe", self, "_on_safe_pressed")
	buttons.connect("danger", self, "_on_danger_pressed")
	reload_delay.connect("timeout", self, "_on_ReloadDelay_timeout")

func _on_safe_pressed():
	input_received(false)

func _on_danger_pressed():
	input_received(true)

func input_received(danger_was_pressed: bool):
	if danger_was_pressed == is_dangerous:
		print("Nice one")
	else:
		print("You're a fool")
	reload_delay.start()

func _on_ReloadDelay_timeout():
	if get_tree().reload_current_scene() != OK:
		print("Reload scene fail")


