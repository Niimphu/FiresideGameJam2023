extends ParallaxLayer

export var CLOUD_SPEED = -40.0

func _process(_delta):
	self.motion_offset.y += CLOUD_SPEED
