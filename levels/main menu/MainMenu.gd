extends Node2D

var save_path = "user://variable.save"
@onready var popMessage = $popupMessage

func _on_button_2_pressed():
	get_tree().quit()


func _on_button_pressed():
	$CanvasLayer/AudioStreamPlayer2D.play()
	load_data()
	
func _on_button_3_pressed():
	#play cut scene
	get_tree().change_scene_to_file("res://levels/tutorial/tutorialScene.tscn")

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path , FileAccess.READ)
		GameManager.money = file.get_var()
		GameManager.scene = file.get_var()
		GameManager.jarashKey = file.get_var()
		GameManager.petraKey = file.get_var()
		GameManager.ajlounKey = file.get_var()
		GameManager.isTutorial = file.get_var()
		get_tree().change_scene_to_file(GameManager.scene)
	else:
		popMessage.visible = true


func _on_button_4_pressed():
	popMessage.visible = false
