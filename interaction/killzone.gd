extends Area2D

@onready var timer = $Timer
@export var money_display : Control

func _on_body_entered(body):
	timer.start()
	if GameManager.money > 6:
		money_display.sub_money()
	
func _on_timer_timeout():
	if GameManager.money > 6:
		GameManager.sub_money(5)
	get_tree().reload_current_scene()
