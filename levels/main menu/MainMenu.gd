extends Node2D



func _on_button_2_pressed():
	get_tree().quit()


func _on_button_pressed():
	$AudioStreamPlayer2D.play()


func _on_button_3_pressed():
	#play cut scene
	get_tree().change_scene_to_file("res://levels/map/map.tscn")
