extends "res://prototypingRoverGame/entity_classes.gd"

@onready var Grid = get_parent().get_node("Grid")

func _ready():
	update_look_direction(Vector2i.UP)

func _process(delta):
	var input_direction = get_input_direction()
	if input_direction == Vector2i.ZERO:
		return
	update_look_direction(input_direction)

	var target_position = Grid.request_move(self, input_direction)
	if target_position:
		move_to(target_position)
	else:
		bump()

func get_input_direction():
	return Vector2i(
		int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")),
		int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	)

func update_look_direction(direction):
	$Sprite2D.rotation = Vector2(direction).angle() + PI/2

func move_to(target_position):
#	set_process(false)
	#$AnimationPlayer.play("walk")

	# Move the node to the target cell instantly,
	# and animate the sprite moving from the start to the target cell
#	var move_direction = (target_position - position).normalized()
	self.position = target_position
#	$Tween.interpolate_property(
#		self,"position",
#		position,target_position,
#		$AnimationPlayer.current_animation_length,
#		Tween.TRANS_LINEAR, Tween.EASE_IN)
#
#	$Tween.start()

	# Stop the function execution until the animation finished
#	await($AnimationPlayer, "animation_finished")
	
#	set_process(true)


func bump():
#	set_process(false)
#	$AnimationPlayer.play("bump")
##	await($AnimationPlayer, "animation_finished")
#	set_process(true)
	pass
