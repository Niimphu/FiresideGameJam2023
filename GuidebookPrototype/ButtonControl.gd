extends Control

onready var buttons = $Buttons.get_children()
onready var delay_timer = $ResultDelay

var danger_selected: bool

signal safe
signal danger

func _ready():
	for button in buttons:
		button.disabled = false

func button_pressed():
	for button in buttons:
		button.disabled = true
	delay_timer.start()

func _on_SafeButton_button_down():
	danger_selected = false
	button_pressed()

func _on_DangerButton_button_down():
	danger_selected = true
	button_pressed()

func _on_ResultDelay_timeout():
	if danger_selected == true:
		emit_signal("danger")
	else:
		emit_signal("safe")
