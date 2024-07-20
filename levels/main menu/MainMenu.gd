extends Node2D



func _on_button_2_pressed():
	get_tree().quit()


func _on_button_pressed():
	$AudioStreamPlayer2D.play()
