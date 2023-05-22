# This autoload script holds information regarding the current game
# state that nodes such as the HUD will need to reference for easy
# access.
#
# Difficulty settings can be adjusted in the GameInfo.tscn inspector =)

extends Node

enum DIFFICULTY { NORMAL, HARD, ENDLESS }

export(float, 0.5, 5, 0.5) var normal_mode_minutes: float = 2.0
export(int, 1, 5) var normal_mode_lives: int = 5

export(float, 0.5, 5, 0.5) var hard_mode_minutes: float = 1.0
export(int, 1, 5) var hard_mode_lives: int = 3

var current_difficulty: int = DIFFICULTY.NORMAL

var current_lives: int = 0