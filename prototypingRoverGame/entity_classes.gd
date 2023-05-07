extends Node2D

enum CELL_TYPES { PLAYER, OBJECT, WALL }

@export var entity_type = CELL_TYPES

func _ready():
	var type: int

	match entity_type:
		PLAYER:
			type = 0
		OBJECT:
			type = 1
		WALL:
			type = 2
