extends RichTextLabel

var timer_regex: RegEx

# func _ready():
# 	timer_regex = RegEx.new()
# 	var error_code = timer_regex.compile("\\d:\\d+")
# 	assert(error_code == 0, "[GameTimerDisplay] Regex Compilation Error")

func set_time(time_left_seconds: float):
	var minutes: int = int(floor(time_left_seconds / 60.0))
	var seconds: int = int(fmod(time_left_seconds, 60.0))

	bbcode_text = "[center]%d:%02d[/center]" % [minutes, seconds]

	#bbcode_text = "[wave amp=10.0 freq=5.0][center]%d:%02d[/center][/wave]" % [minutes, seconds]
	
	# var search_result = timer_regex.search(bbcode_text)

	# if search_result:
	# 	bbcode_text.replace(search_result.get_string(), "%d:%02d" % [minutes, seconds])