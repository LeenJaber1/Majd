extends Node2D

@onready var answer = $LineEdit
func _on_button_pressed():
	if answer.text == "-12":
		$"Button/AudioStreamPlayer2D".play()
	else:
		answer.text = ""
		$AudioStreamPlayer2D.play()


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://levels/jarash/mainJarashScene.tscn")
