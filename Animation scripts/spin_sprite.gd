extends Sprite

export var rotate_modifier: float

func _process(delta):
	rotation += rotate_modifier * delta
