extends Control

func _ready():
	self.visible = false

func _on_Normal_pressed():
	if get_tree().change_scene("res://GuidebookPrototype/TestLevel.tscn") != OK:
		print("failge")

func _on_Hard_pressed():
	if get_tree().change_scene("res://GuidebookPrototype/TestLevel.tscn") != OK:
		print("failge")

func _on_Zen_pressed():
	if get_tree().change_scene("res://GuidebookPrototype/TestLevel.tscn") != OK:
		print("failge")

func _on_Back_pressed():
	self.visible = false
