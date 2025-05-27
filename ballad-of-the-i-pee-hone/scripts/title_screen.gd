extends Node2D

@onready var button = $CanvasLayer/Button

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/intro_cutscene.tscn")

func _process(delta):
	if Input.is_anything_pressed():
		button.grab_focus()
	if Input.is_action_pressed("ui_accept") and button.has_focus():
		button.emit_signal("pressed")
