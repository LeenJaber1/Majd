extends Node2D
@onready var word = "حستقشسحجبلرفمفييهكنز"
@onready var lineEdits = [$"Sprites(17)/7a2",$"Sprites(17)/seen",$"Sprites(17)/ta2", $"Sprites(17)/qaf",$"Sprites(17)/sheen",$"Sprites(17)/seen2", $"Sprites(17)/7a22",$"Sprites(17)/jeem" ,$"Sprites(17)/ba2",$"Sprites(17)/lam", $"Sprites(17)/ra2",$"Sprites(17)/fa2",$"Sprites(17)/meem", $"Sprites(17)/fa22",$"Sprites(17)/ya2", $"Sprites(17)/ya22",  $"Sprites(17)/ha2",$"Sprites(17)/kaf", $"Sprites(17)/noon", $"Sprites(17)/zain"]

func _on_button_pressed():
	for index in 20:
		var element = lineEdits[index]
		print (element)
		if word[index] != element.text || element.text == "":
			$wrongAns.play()
			break
		if index == 19:
			$rightAns.play()
			GameManager.petraKey = true
			await $rightAns.finished

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://levels/Petra/mainPetra.tscn")
