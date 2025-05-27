extends Node

var fade_music_called: bool = false

signal call_function(func_name:String)

func fade_music():
	var tween = create_tween()
	tween.tween_property(IntroMusic, "volume_db", -80, 10.0)
	tween.tween_callback(Callable(IntroMusic, "stop"))

func _process(delta):
	if get_tree().current_scene and get_tree().current_scene.scene_file_path == "res://scenes/play_scene_0.tscn" and not fade_music_called:
		fade_music()
		fade_music_called = true
		print("played")

func transition(scene_name):
	print(transition)
	get_tree().change_scene_to_file(scene_name)

func emit_function(func_name:String):
	call_function.emit(func_name)
