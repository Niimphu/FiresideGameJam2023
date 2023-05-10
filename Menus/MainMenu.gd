extends Control

onready var settings_menu = get_node("/root/MainMenu/SettingsMenu")
onready var play_menu = get_node("/root/MainMenu/PlayMenu")

func _ready():
	SoundControl.play_music()

func _on_Settings_pressed():
	settings_menu.visible = true

func _on_Play_pressed():
	play_menu.visible = true

func _on_Exit_pressed():
	get_tree().quit()
