extends Control
@onready var popMessage = $popupMessage
var save_path = "user://variable.save"
var paused = false

func resume():
	paused = false
	visible = false
	
func pause():
	paused = true
	visible = true
	
func disable_save():
	$Button.disabled = true

func input_map():
	if Input.is_action_just_pressed("esc"):
		$paperSound.play()
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

func _on_button_pressed():
	var file = FileAccess.open(save_path , FileAccess.WRITE)
	var scene = GameManager.scene
	var jarashKey = GameManager.jarashKey
	var petraKey =  GameManager.petraKey
	var ajlounKey = GameManager.ajlounKey
	var money = GameManager.money
	var isTutorial = GameManager.isTutorial
	file.store_var(money)
	file.store_var(scene)
	file.store_var(jarashKey)
	file.store_var(petraKey)
	file.store_var(ajlounKey)
	file.store_var(isTutorial)
	popMessage.visible = true

func _on_button_2_pressed():
	popMessage.visible = false
