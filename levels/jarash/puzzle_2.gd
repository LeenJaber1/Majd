extends Node2D

@onready var answer1 = $CenterContainer/LineEdit
@onready var answer2 = $CenterContainer2/LineEdit
@onready var answer3 = $CenterContainer3/LineEdit

func _on_button_pressed():
	var value1 = int(answer1.text)
	var value2 = int(answer2.text)
	var value3 = int(answer3.text)
	
	if ((value1 * value2) + value3) == 27:
		$"Button/AudioStreamPlayer2D".play()
	else:
		answer1.text = ""
		answer2.text = ""
		answer3.text = ""
		$AudioStreamPlayer2D.play()


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://levels/jarash/mainJarashScene.tscn")
