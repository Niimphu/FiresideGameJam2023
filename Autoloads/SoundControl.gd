extends Node

onready var music_player = $MusicPlayer

var track_1 = load("res://Sounds/Music/Track 1.mp3")

func _ready():
	pass

func play_music():
	music_player.stream = track_1
	music_player.play()