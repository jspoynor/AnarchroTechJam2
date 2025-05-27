extends CharacterBody2D

var idle_direction: int = 0
var speed: float = 30
@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity *= speed
	move_and_slide()

func _process(delta):
	if Input.is_action_pressed("ui_down"):
		animated_sprite_2d.play("walk_down")
		idle_direction = 0
	elif Input.is_action_pressed("ui_up"):
		animated_sprite_2d.play("walk_up")
		idle_direction = 0
	elif Input.is_action_pressed("ui_right"):
		animated_sprite_2d.play("walk_right")
		idle_direction = 1
	elif Input.is_action_pressed("ui_left"):
		animated_sprite_2d.play("walk_left")
		idle_direction = -1
	else:
		if idle_direction < 0:
			animated_sprite_2d.play("idle_left")
		elif idle_direction > 0:
			animated_sprite_2d.play("idle_right")
		else:
			animated_sprite_2d.play("idle_down")
