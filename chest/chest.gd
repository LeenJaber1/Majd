extends Node2D


@onready var interactionArea = $InteractionArea
@onready var sprite = $AnimatedSprite2D

func _on_ready():
	interactionArea.interact = Callable(self, "_open_chest")

func _open_chest():
	sprite.play("opening")
	
