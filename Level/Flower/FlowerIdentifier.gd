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
	pass

func check_danger() -> bool:
	var even_stamen: bool = (stamen_evenness == evenness.EVEN)
	var pollen_present: bool = (has_pollen == pollening.YES)
	var pointy_petals: bool = (petal_roundness == roundness.POINTY)
	var many_petals: bool = (petal_amount == amount.MANY)
	var is_thorny: bool = (stem_thorny == thorny.YES)
	var leafy_stem: bool = (stem_leafy == leafy.YES)

	match petal_colour:
		colour.WHITE:
			check_danger_white_flower(is_thorny, many_petals, pollen_present, pointy_petals, leafy_stem, even_stamen)
		colour.RED:
			check_danger_red_flower(many_petals, pollen_present, pointy_petals, leafy_stem, even_stamen)
		colour.PURPOLLL:
			check_danger_purpoll_flower(is_thorny, many_petals, pollen_present, pointy_petals, leafy_stem, even_stamen)
		colour.BLUE:
			check_danger_blue_flower(is_thorny, many_petals, pollen_present, pointy_petals, leafy_stem, even_stamen)
	
	return true
	
func check_danger_blue_flower(is_thorny: bool, many_petals: bool, pollen_present: bool, pointy_petals: bool, leafy_stem: bool, even_stamen: bool):
	if is_thorny and many_petals and pollen_present and pointy_petals:
		return false
	elif is_thorny and many_petals and pollen_present and not pointy_petals:
		return true
	elif is_thorny and many_petals and not pollen_present and leafy_stem and pointy_petals:
		return false
	elif is_thorny and many_petals and not pollen_present and leafy_stem and not pointy_petals:
		return true
	elif is_thorny and many_petals and not pollen_present and not leafy_stem and pointy_petals:
		return true
	elif is_thorny and many_petals and not pollen_present and not leafy_stem and not pointy_petals:
		return true
	elif is_thorny and not many_petals and pointy_petals:
		return true
	elif is_thorny and not many_petals and not pointy_petals:
		return false
	elif not is_thorny and even_stamen and many_petals and pollen_present and pointy_petals:
		return false
	elif not is_thorny and even_stamen and many_petals and pollen_present and not pointy_petals:
		return true
	elif not is_thorny and even_stamen and many_petals and not pollen_present and leafy_stem and pointy_petals:
		return false
	elif not is_thorny and even_stamen and many_petals and not pollen_present and leafy_stem and not pointy_petals:
		return true
	elif not is_thorny and even_stamen and many_petals and not pollen_present and not leafy_stem and pointy_petals:
		return true
	elif not is_thorny and even_stamen and many_petals and not pollen_present and not leafy_stem and not pointy_petals:
		return true
	elif not is_thorny and even_stamen and not many_petals and pointy_petals:
		return true
	elif not is_thorny and even_stamen and not many_petals and not pointy_petals:
		return false
	elif not is_thorny and not even_stamen and pollen_present and pointy_petals:
		return false
	elif not is_thorny and not even_stamen and pollen_present and not pointy_petals:
		return true
	elif not is_thorny and not even_stamen and not pollen_present and leafy_stem and pointy_petals:
		return false
	elif not is_thorny and not even_stamen and not pollen_present and leafy_stem and not pointy_petals:
		return true
	elif not is_thorny and not even_stamen and not pollen_present and not leafy_stem and pointy_petals:
		return true
	elif not is_thorny and not even_stamen and not pollen_present and not leafy_stem and not pointy_petals:
		return true

func check_danger_red_flower(many_petals: bool, pollen_present: bool, pointy_petals: bool, leafy_stem: bool, even_stamen: bool):
	if even_stamen and many_petals and pollen_present and pointy_petals:
		return false
	elif even_stamen and many_petals and pollen_present and not pointy_petals:
		return true
	elif even_stamen and many_petals and not pollen_present and leafy_stem and pointy_petals:
		return false
	elif even_stamen and many_petals and not pollen_present and leafy_stem and not pointy_petals:
		return true
	elif even_stamen and many_petals and not pollen_present and not leafy_stem and pointy_petals:
		return true
	elif even_stamen and many_petals and not pollen_present and not leafy_stem and not pointy_petals:
		return true
	elif even_stamen and not many_petals and pointy_petals:
		return true
	elif even_stamen and not many_petals and not pointy_petals:
		return false
	elif not even_stamen and pollen_present and pointy_petals:
		return false
	elif not even_stamen and pollen_present and not pointy_petals:
		return true
	elif not even_stamen and not pollen_present and leafy_stem and pointy_petals:
		return false
	elif not even_stamen and not pollen_present and leafy_stem and not pointy_petals:
		return true
	elif not even_stamen and not pollen_present and not leafy_stem and pointy_petals:
		return true
	elif not even_stamen and not pollen_present and not leafy_stem and not pointy_petals:
		return true

func check_danger_purpoll_flower(is_thorny: bool, many_petals: bool, pollen_present: bool, pointy_petals: bool, leafy_stem: bool, even_stamen: bool):
	if many_petals and leafy_stem and pointy_petals:
		return true
	elif many_petals and leafy_stem and not pointy_petals and is_thorny and even_stamen:
		return false
	elif many_petals and leafy_stem and not pointy_petals and is_thorny and not even_stamen:
		return true
	elif many_petals and leafy_stem and not pointy_petals and not is_thorny:
		return false
	elif many_petals and not leafy_stem and not is_thorny:
		return false
	elif many_petals and not leafy_stem and is_thorny and even_stamen:
		return false
	elif many_petals and not leafy_stem and is_thorny and not even_stamen:
		return true
	elif not many_petals and pollen_present and is_thorny and even_stamen:
		return false
	elif not many_petals and pollen_present and is_thorny and not even_stamen:
		return true
	elif not many_petals and pollen_present and not is_thorny:
		return false
	elif not many_petals and not pollen_present and leafy_stem:
		return true
	elif not many_petals and not pollen_present and not leafy_stem and pointy_petals:
		return true
	elif not many_petals and not pollen_present and not leafy_stem and not pointy_petals and not is_thorny:
		return false
	elif not many_petals and not pollen_present and not leafy_stem and not pointy_petals and is_thorny and even_stamen:
		return false
	elif not many_petals and not pollen_present and not leafy_stem and not pointy_petals and is_thorny and not even_stamen:
		return true

func check_danger_white_flower(is_thorny: bool, many_petals: bool, pollen_present: bool, pointy_petals: bool, leafy_stem: bool, even_stamen: bool):
	if many_petals and pollen_present and is_thorny and even_stamen:
		return false
	elif many_petals and pollen_present and is_thorny and not even_stamen:
		return true
	elif many_petals and pollen_present and not is_thorny:
		return false
	elif many_petals and not pollen_present and leafy_stem:
		return true
	elif many_petals and not pollen_present and not leafy_stem and pointy_petals:
		return true
	elif many_petals and not pollen_present and not leafy_stem and not pointy_petals and not is_thorny:
		return false
	elif many_petals and not pollen_present and not leafy_stem and not pointy_petals and is_thorny and even_stamen:
		return false
	elif many_petals and not pollen_present and not leafy_stem and not pointy_petals and is_thorny and not even_stamen:
		return true
	elif not many_petals and leafy_stem:
		return true
	elif not many_petals and not leafy_stem and pointy_petals:
		return true
	elif not many_petals and not leafy_stem and not pointy_petals and not is_thorny:
		return false
	elif not many_petals and not leafy_stem and not pointy_petals and is_thorny and even_stamen:
		return false
	elif not many_petals and not leafy_stem and not pointy_petals and is_thorny and not even_stamen:
		return true

func initialise_features():
	petals.material.set_shader_param("colour_index", randi() % 4)
	
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
	
	match petals.material.get_shader_param("colour_index"):
		0:
			petal_colour = colour.WHITE
		1:
			petal_colour = colour.RED
		2:
			petal_colour = colour.PURPOLLL
		3:
			petal_colour = colour.BLUE
