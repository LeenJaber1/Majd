extends Node2D


@onready var interactionArea = $InteractionArea
@onready var sprite = $AnimatedSprite2D

func _on_ready():
	interactionArea.interact = Callable(self, "_open_chest")

var isOpen = false

func _open_chest():
	if(!isOpen):
		$AudioStreamPlayer.play()
		var random = randi() % 7 + 5
		GameManager.add_money(random)
		sprite.play("opening")
		isOpen = true
		InteractionManager.unregisterArea(interactionArea)
		$InteractionArea/CollisionShape2D.disabled = true
	
