extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	timer.start()
	
func _on_timer_timeout():
	if GameManager.money > 6:
		GameManager.sub_money(5)
	get_tree().reload_current_scene()
