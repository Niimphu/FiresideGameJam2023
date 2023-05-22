extends CanvasLayer

var settings_menu: Control

func _ready():
	# To allow this node to still process and unpause the game while it is paused
	pause_mode = PAUSE_MODE_PROCESS

	visible = false

	settings_menu = get_node_or_null("SettingsMenu")
	assert(settings_menu != null, "[Error][PauseMenu] Attempted to get the SettingsMenu node but it was not found.")
	settings_menu.visible = false

func _process(_delta):
	if Input.is_action_just_pressed("pause_game"):
		if settings_menu.visible and get_tree().paused:
			settings_menu.visible = false
			return
		else:
			# This prevents a rare glitch that can occur if a player hits
			# the settings but and the unpause button at the same time.
			settings_menu.visible = false
		
		var paused: bool = not get_tree().paused
		get_tree().paused = paused
		visible = paused

func _on_Button_Menu_pressed():
	Load.change_scene(get_tree().current_scene, "res://Menus/MainMenu.tscn")
	get_tree().paused = false
	visible = false

func _on_Button_Settings_pressed():
	settings_menu.visible = true

func _on_Button_Resume_pressed():
	get_tree().paused = false
	visible = false
