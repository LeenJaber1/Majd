extends Node2D




func _on_ajloun_pressed():
	$AudioStreamPlayer.play()
	get_tree().change_scene_to_file("res://levels/ajloun/ajloun.tscn")
	



func _on_jarash_pressed():
	$AudioStreamPlayer.play()
	get_tree().change_scene_to_file("res://levels/jarash/mainJarashScene.tscn")
	
	
	


func _on_petra_pressed():
	$AudioStreamPlayer.play()
	get_tree().change_scene_to_file("res://levels/Petra/mainPetra.tscn")
