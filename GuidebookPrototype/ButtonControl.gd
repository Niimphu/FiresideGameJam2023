extends Control

onready var buttons = $Buttons.get_children()
onready var button_cooldown = $ButtonCooldown

var danger_selected: bool

signal safe
signal danger

func _ready():
	enable_buttons()

func button_pressed():
	for button in buttons:
		button.disabled = true
	button_cooldown.start()

func _on_SafeButton_button_down():
	emit_signal("safe")
	button_pressed()

func _on_DangerButton_button_down():
	emit_signal("danger")
	button_pressed()

func _on_ButtonCooldown_timeout():
	enable_buttons()

func enable_buttons():
	for button in buttons:
		button.disabled = false
