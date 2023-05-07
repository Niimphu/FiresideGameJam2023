extends RigidBody2D

export var movement_force: float = 10000
export var movement_slowdown_speed: float = 10000
export var turn_sensitivity: float = 200000
export var turn_slow_down_speed: float = 2000000

var turn_offset_vector: Vector2 = Vector2(50, 0)
var current_applied_force: Vector2 = Vector2.ZERO

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		applied_torque = turn_sensitivity
	elif Input.is_action_pressed("ui_left"):
		applied_torque = -turn_sensitivity
	else:
		applied_torque = move_toward(applied_torque, 0.0, delta * turn_slow_down_speed)
	
	if Input.is_action_pressed("ui_up"):
		current_applied_force = Vector2(0, -movement_force)
	else:
		current_applied_force = current_applied_force.move_toward(Vector2.ZERO, delta * movement_slowdown_speed)

	applied_force = current_applied_force.rotated(rotation)
