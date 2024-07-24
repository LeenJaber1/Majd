extends Node2D


@export var levelPath = ""
@onready var interaction = $InteractionArea
@export var action_name = "للتفاعل"

func _on_ready():
	interaction.action_name = action_name
	interaction.interact = Callable(self, "_open_level")
	
func _open_level():
	GameManager.set_player_position(interaction.global_position)
	GameManager.isDefault = false
	if levelPath == "res://levels/ajloun/passwordPuzzle/passwordPuzzle.tscn" && GameManager.ajlounPuzzleSolved:
		levelPath = "res://levels/ajloun/mosiacPuzzle/mosiacPuzzle.tscn"
	get_tree().change_scene_to_file(levelPath)
