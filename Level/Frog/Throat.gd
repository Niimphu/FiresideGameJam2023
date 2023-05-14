extends Sprite

onready var ribbit_timer = $RibbitDelay
onready var tween_1 = $Tween1
onready var tween_2 = $Tween2
onready var ribbit = $Ribbit

var ribbiting

func _ready():
	randomize()
	if randi() % 2 == 1:
		ribbiting = true
	else:
		ribbiting = false
	if ribbiting == true:
		ribbit_timer.start()

func _on_RibbetDelay_timeout():
	randomize()
	ribbit_timer.set_wait_time(randf() * 4.0 + 1.0)
	ribbit.play()
	tween_1.interpolate_property(self, "position", Vector2.ZERO, Vector2(30, 30), 0.1, tween_1.TRANS_LINEAR, tween_1.EASE_OUT_IN)
	tween_1.start()

func _on_Tween1_tween_all_completed():
	tween_2.interpolate_property(self, "position", Vector2(30.0, 30.0), Vector2.ZERO, 0.1, tween_2.TRANS_LINEAR, tween_2.EASE_OUT_IN)
	tween_2.start()
