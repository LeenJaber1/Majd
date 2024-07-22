extends Control


var paused = false

func resume():
	paused = false
	visible = false
	
func pause():
	paused = true
	visible = true

func input_map():
	if Input.is_action_just_pressed("esc"):
		if paused:
			resume()
		else:
			pause()
		
func _process(delta):
	input_map()

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://levels/main menu/MainMenu.tscn")

func _on_play_pressed():
	resume()
