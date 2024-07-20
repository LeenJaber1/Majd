extends Control



func _on_submit_button_button_down():
	var word = "جلعاد"
	var lineEdits = [$firstLineEdit, $secondLineEdit, $thirdLineEdit, $fourthLineEdit, $fifthLineEdit]

	for index in 5:
		if word[index] != lineEdits[index].get_text():
			$wrongAudio.play()
			break
		if index == 3:
			$correctAudio.play()
			await $correctAudio.finished
			get_tree().change_scene_to_file("res://levels/ajloun/mosiacPuzzle/mosiacPuzzle.tscn")
