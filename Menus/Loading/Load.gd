extends Node

onready var load_scene = preload("res://Menus/Loading/LoadingScreen.tscn")

func change_scene(current_scene, new_scene):
	var load_scene_instance = load_scene.instance()
	
	get_tree().get_root().call_deferred("add_child", load_scene_instance)
	
	var loader = ResourceLoader.load_interactive(new_scene)
	
	if !loader:
		print("loader failge")
		return
	
	current_scene.queue_free()
	
	yield(get_tree().create_timer(2), "timeout") #delay
	
	while true:
		var error = loader.poll()
		
		if error == OK:
			print("loading: ", float(loader.get_stage())/loader.get_stage_count() * 100, "%")
			#potential progress indicator
			#float(loader.get_stage())/loader.get_stage_count() * 100
		
		elif error == ERR_FILE_EOF:
			print("done")
			load_scene_instance.get_node("Fader/AnimationPlayer").play("fade_out")
			yield(get_tree().create_timer(3), "timeout") #delay
			
			var scene = loader.get_resource().instance()
			get_tree().get_root().call_deferred("add_child", scene)
			load_scene_instance.queue_free()
			return
		
		else:
			print("failge")
			return
