extends Node2D

@onready var animation_player = $AnimationPlayer

@onready var intro_dialogue = preload("res://dialogue/intro_cutscene.dialogue")
func _ready():
	DialogueManager.show_dialogue_balloon(intro_dialogue)
	Global.connect("call_function", call_function)

func call_function(func_name:String):
	call(func_name)

func fade_out_black():
	animation_player.play("fade out black")
