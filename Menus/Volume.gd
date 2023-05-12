extends Control

onready var music_bus = AudioServer.get_bus_index("Music")
onready var sfx_bus = AudioServer.get_bus_index("SFX")
onready var music_slider = $MarginContainer/VBoxContainer/HBoxContainer/Sliders/MusicSlider
onready var sfx_slider = $MarginContainer/VBoxContainer/HBoxContainer/Sliders/SFXSlider

func _ready():
	var music_volume = AudioServer.get_bus_volume_db(music_bus)
	var sfx_volume = AudioServer.get_bus_volume_db(sfx_bus)
	
	self.visible = false
	music_slider.value = music_volume if music_volume >= -30 else -30
	sfx_slider.value = sfx_volume if sfx_volume >= -30 else -30

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


