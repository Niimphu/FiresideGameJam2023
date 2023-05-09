extends Control

onready var settings_menu = get_node("/root/MainMenu/SettingsMenu")

func _ready():
	SoundControl.play_music()

func _on_Settings_pressed():
	settings_menu.visible = true

func _on_Play_pressed():
	get_tree().change_scene("res://GuidebookPrototype/TestLevel.tscn")

func _on_Exit_pressed():
	get_tree().quit()
