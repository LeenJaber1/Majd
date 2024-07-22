extends Control

var paused = false
func closeMap():
	paused = false
	visible = false
	
func openMap():
	paused = true
	visible = true

func input_map():
	if Input.is_action_just_pressed("map"):
		if paused:
			closeMap()
		else:
			openMap()
		
func _process(delta):
	input_map()

func _on_ajloun_pressed():
	$AudioStreamPlayer.play()
	get_tree().change_scene_to_file("res://levels/ajloun/ajloun.tscn")
	
func _on_jarash_pressed():
	$AudioStreamPlayer.play()
	get_tree().change_scene_to_file("res://levels/jarash/mainJarashScene.tscn")
	
func _on_petra_pressed():
	$AudioStreamPlayer.play()
	get_tree().change_scene_to_file("res://levels/Petra/mainPetra.tscn")
