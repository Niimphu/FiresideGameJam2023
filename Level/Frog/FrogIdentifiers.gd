extends Node2D

onready var environment = $Environment
onready var webs = $Webs
onready var eye = $EyePupil
onready var fire = $Fire
onready var throat = $Throat
onready var body = $Body

enum location { LILY, REEDS }
enum temp { WHITE, RED, YELLOW, BLUE }
enum shape { SLIT, MINUS, PLUS }

var habitat
var is_ribbiting
var has_webbed_feet
var temperature
var eye_shape

func _ready():
	set_frog_colour()

func set_frog_colour():
	body.modulate = Color(randf() / 3 + 0.5, randf() / 3 + 0.5, randf() / 3 + 0.5, 1.0)

func check_danger() -> bool:

	return true

func initialise_features():
	habitat = location.LILY if environment.frame == 0 else location.REEDS
	
	is_ribbiting = throat.ribbiting #bool
	
	has_webbed_feet = false if webs.frame == 0 else true
	
	match eye.frame:
		0:
			eye_shape = shape.SLIT
		1:
			eye_shape = shape.MINUS
		2:
			eye_shape = shape.PLUS
	
	fire.material.set_shader_param("colour_index", randi() % 4)
	
	match fire.material.get_shader_param("colour_index"):
		0:
			temperature = temp.WHITE
		1:
			temperature = temp.RED
		2:
			temperature = temp.YELLOW
		3:
			temperature = temp.BLUE
