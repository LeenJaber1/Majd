extends Control

func _on_submit_button_button_down():
	var word = "جلعاد"
	var lineEdits = [$firstLineEdit, $secondLineEdit, $thirdLineEdit, $fourthLineEdit, $fifthLineEdit]

	for index in 5:
		if word[index] != lineEdits[index].get_text():
			$wrongAudio.play()
			break
		if index == 4:
			GameManager.ajlounPuzzleSolved = true
			$correctAudio.play()
			await $correctAudio.finished
			get_tree().change_scene_to_file("res://levels/ajloun/mosiacPuzzle/mosiacPuzzle.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://levels/ajloun/ajloun.tscn")


func _on_ready():
	if GameManager.ajlounPuzzleSolved:
		get_tree().change_scene_to_file("res://levels/ajloun/mosiacPuzzle/mosiacPuzzle.tscn")
