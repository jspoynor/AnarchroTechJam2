extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var label = $CanvasLayer/Label
@onready var undertale_sound = $undertaleSound

@onready var intro_dialogue = preload("res://dialogue/intro_cutscene.dialogue")
@onready var cowboy_dialogue = preload("res://dialogue/intro_cowboys.dialogue")

func _ready():
	DialogueManager.show_dialogue_balloon(intro_dialogue)
	Global.connect("call_function", call_function)
	label.visible = false

func _process(delta):
	if label.visible && Input.is_action_just_pressed("ui_accept"):
		label.visible = false
		DialogueManager.show_dialogue_balloon(cowboy_dialogue)

func call_function(func_name:String):
	call(func_name)

func fade_out_black():
	animation_player.play("fade out black")

func show_label():
	label.z_index = 1
	undertale_sound.play()
	await get_tree().create_timer(0.1).timeout
	label.visible = true
	
