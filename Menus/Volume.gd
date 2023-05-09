extends Control

onready var music_bus = AudioServer.get_bus_index("Music")

func _ready():
	self.visible = false

func _on_MusicSlider_value_changed(value):
	AudioServer.set_bus_volume_db(music_bus, value)

	if value < -30:
		AudioServer.set_bus_mute(music_bus, true)
	else:
		AudioServer.set_bus_mute(music_bus, false)

func _on_Back_pressed():
	self.visible = false
