extends Node2D

onready var stamen = $Stamen
onready var pollen = $Pollen
onready var petals = $Petals
onready var stem = $Stem

enum evenness { ODD, EVEN }
enum pollening { NO, YES }
enum colour { WHITE, RED, PURPOLLL, BLUE }
enum roundness { ROUND, POINTY }
enum amount { FEW, MANY }
enum thorny { YES, NO }
enum leafy { YES, NO }

var stamen_evenness
var has_pollen
var petal_colour
var petal_roundness
var petal_amount
var stem_thorny
var stem_leafy

func _ready():
	randomize()
	petals.material.set_shader_param("colour_index", randi() % 4)
	initialise_features()

func check_danger() -> bool:
#	if petal_colour == colour.ORANGE:
#		if petal_amount == amount.FEW:
#			return true
#		elif stamen_evenness ==evenness.ODD:
#			return false
#		elif location ==environment.TREE:
#			return false
#		else:
#			return true
#	elif petal_colour == colour.BLUE:
#		if stamen_evenness ==evenness.EVEN:
#			return true
#		else:
#			return false
#	elif petal_colour == colour.WHITE:
#		if location == environment.TREE and petal_amount == amount.MANY:
#			return true
#		else:
#			return false
#	else: #petals are red
#		if petal_amount ==amount.FEW:
#			return false
#		elif stamen_evenness ==evenness.EVEN and location == environment.GRASS:
#			return false
#		else:
#			return true
	return true

func initialise_features():
	stamen_evenness = evenness.ODD if stamen.frame % 2  else evenness.EVEN
	
	has_pollen = pollening.NO if pollen.frame == 0 else pollening.YES
	
	petal_amount = amount.FEW if petals.frame < 2 else amount.MANY
	
	petal_roundness = roundness.POINTY if petals.frame == 1 or petals.frame == 2 else roundness.ROUND
	
	stem_thorny = thorny.YES if stem.frame > 1 else thorny.NO
	
	stem_leafy = leafy.YES if stem.frame % 2 else leafy.NO
	
	if pollen.frame == 0:
		pollen.get_node("Particles2D").visible = false
	else:
		pollen.get_node("Particles2D").visible = true
	
	match petal_colour:
		0:
			petal_colour = colour.WHITE
		1:
			petal_colour = colour.RED
		2:
			petal_colour = colour.PURPOLLL
		3:
			petal_colour = colour.BLUE
