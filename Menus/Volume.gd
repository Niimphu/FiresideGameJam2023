extends Control

onready var music_bus = AudioServer.get_bus_index("Music")
onready var sfx_bus = AudioServer.get_bus_index("SFX")

func _ready():
	self.visible = false

func change_volume(bus, value):
	AudioServer.set_bus_volume_db(bus, value)

	if value <= -30:
		AudioServer.set_bus_mute(bus, true)
	else:
		AudioServer.set_bus_mute(bus, false)

func _on_MusicSlider_value_changed(value):
	change_volume(music_bus, value)

func _on_SFXSlider_value_changed(value):
	change_volume(sfx_bus, value)

func _on_Back_pressed():
	self.visible = false


