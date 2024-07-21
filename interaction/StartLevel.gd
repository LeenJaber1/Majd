extends Node2D


@export var levelPath = ""
@onready var interaction = $InteractionArea
@export var action_name = "interact"

func _on_ready():
	interaction.action_name = action_name
	interaction.interact = Callable(self, "_open_level")
	
func _open_level():
	get_tree().change_scene_to_file(levelPath)
