extends Area2D

class_name InteractionArea

@export var action_name: String = "interact"

var interact: Callable = func():
	pass


func _on_body_entered(body):
	print("entered")
	InteractionManager.regeisterArea(self)


func _on_body_exited(body):
	InteractionManager.unregisterArea(self)
