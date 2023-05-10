extends ColorRect

func _ready():
	self.visible = true

func _on_AnimationPlayer_animation_started(_anim_name):
	self.visible = true

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_in":
		self.visible = false
