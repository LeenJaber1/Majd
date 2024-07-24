extends Node2D


@onready var coins = $"../CanvasLayer/MoneyDisplay"
@onready var interactionArea = $InteractionArea2
@onready var popMessage =  $CanvasLayer/popupMessage
@onready var video = $CanvasLayer/VideoStreamPlayer
func _ready():
	interactionArea.interact = Callable(self, "open_end_scene")

func open_end_scene():
	if GameManager.petraKey and GameManager.jarashKey and GameManager.ajlounKey:
		video.play()
		coins.visible = false
	else:
		popMessage.visible = true
		
		
func _on_button_pressed():
	popMessage.visible = false
