extends Node2D


const Ballon = preload("res://Dialogue/balloon.tscn")
@onready var interactionArea = $InteractionArea2

func _ready():
	interactionArea.interact = Callable(self, "_open_dialouge")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _open_dialouge():
	var ballon : Node = Ballon.instantiate()
	get_tree().current_scene.add_child(ballon)
	ballon.start(load("res://Dialogue/main.dialogue") , "mom")
	
	


