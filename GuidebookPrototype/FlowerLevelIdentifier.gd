extends "res://GuidebookPrototype/Identifier.gd"

onready var stamen = $Stamen
onready var flower = $Flower
onready var background = $Background

enum evenness { ODD, EVEN }
enum environment { GRASS, TREE }
enum colour { RED, BLUE, ORANGE, WHITE }
enum roundness { ROUND, POINTY }
enum amount { FEW, MANY }

var stamen_evenness
var location
var petal_colour
var petal_roundness
var petal_amount

func _process(delta):
	initialise_features()
	is_dangerous = check_danger()

func check_danger() -> bool:
		if petal_colour == colour.ORANGE:
			if petal_amount == amount.FEW:
				return true
			elif stamen_evenness ==evenness.ODD:
				return false
			elif location ==environment.TREE:
				return false
			else:
				return true
		elif petal_colour == colour.BLUE:
			if stamen_evenness ==evenness.EVEN:
				return true
			else:
				return false
		elif petal_colour == colour.WHITE:
			if location == environment.TREE and petal_amount == amount.MANY:
				return true
			else:
				return false
		else: #petals are red
			if petal_amount ==amount.FEW:
				return false
			elif stamen_evenness ==evenness.EVEN and location == environment.GRASS:
				return false
			else:
				return true

func initialise_features():
	stamen_evenness = evenness.ODD if stamen.frame == 2  else evenness.EVEN

	location = environment.TREE if background.frame == 1 else environment.GRASS
	
	petal_amount = amount.FEW if flower.frame < 4 else amount.MANY

	match flower.frame:
		0:
			petal_colour = colour.RED
			petal_roundness = roundness.ROUND
		1:
			petal_colour = colour.WHITE
			petal_roundness = roundness.ROUND
		2:
			petal_colour = colour.ORANGE
			petal_roundness = roundness.POINTY
		3:
			petal_colour = colour.BLUE
			petal_roundness = roundness.POINTY
		4:
			petal_colour = colour.WHITE
			petal_roundness = roundness.POINTY
		5:
			petal_colour = colour.ORANGE
			petal_roundness = roundness.POINTY
		6:
			petal_colour = colour.BLUE
			petal_roundness = roundness.ROUND
		7:
			petal_colour = colour.RED
			petal_roundness = roundness.ROUND
