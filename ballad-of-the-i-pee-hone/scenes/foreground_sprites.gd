extends Node2D

@onready var player_character = $"../playerCharacter"

func _process(delta):
	for child in get_children():
		if child.position.y > player_character.position.y:
			child.z_index = 1
		else:
			child.z_index = 0
