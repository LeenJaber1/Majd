extends Node2D

@onready var answer = $CenterContainer/LineEdit

func _on_button_pressed():
	if answer.text == "3":
		$"Button/AudioStreamPlayer2D".play()
	else:
		answer.text = ""
		$AudioStreamPlayer2D.play()
