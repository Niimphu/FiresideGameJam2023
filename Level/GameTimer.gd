extends Timer

func _on_LevelControl_level_change():
	var minutes: float

	match GameInfo.current_difficulty:
		GameInfo.DIFFICULTY.NORMAL:
			minutes = GameInfo.normal_mode_minutes
		GameInfo.DIFFICULTY.HARD:
			minutes = GameInfo.hard_mode_minutes
	
	wait_time = minutes * 60.0

func _on_GameTimerDelayStart_timeout():
	start()