extends Node

onready var level_change_delay = $LevelChangeDelay
onready var game_timer: Timer = $GameTimer
onready var game_timer_display: RichTextLabel = $HUD/GameTimerDisplay

signal level_change

var sprites
var current_level
var current_level_instance
var next_level
var identifiers

var is_dangerous: bool
var scenes = [preload("res://Level/Flower/Flower.tscn")]

func _ready():
	new_level()
	emit_signal("level_change")
	game_timer_display.set_time(game_timer.wait_time)

func _process(_delta):
	if not game_timer.is_stopped():
		game_timer_display.set_time(game_timer.time_left)

func new_level():
	randomize()
	current_level = scenes[randi() % scenes.size()]
	current_level_instance = (current_level.instance())
	$Level.add_child(current_level_instance)
	identifiers = current_level_instance.get_node("Identifiers")
	randomise_sprites()

func randomise_sprites():
	randomize()
	sprites = identifiers.get_children()
	for child in sprites:
		if child.is_class("AnimatedSprite"):
			child.frame = randi() % child.frames.get_frame_count("default")
	identifiers.initialise_features()

func _on_ButtonControl_safe():
	input_received(false)

func _on_ButtonControl_danger():
	input_received(true)

func input_received(danger_was_pressed: bool):
	is_dangerous = identifiers.check_danger()
	if danger_was_pressed == is_dangerous:
		print("Nice one")
	else:
		print("You're a fool")
	level_change_delay.start()

func _on_LevelChangeDelay_timeout():
	current_level_instance.queue_free()
	new_level()
