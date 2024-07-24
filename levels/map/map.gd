extends Control

var paused = false
@onready var money_display = $MoneyDisplay
@onready var popMessage = $popupMessage
@onready var key1 = $KeyBig
@onready var key2 = $KeyBig2
@onready var key3 = $KeyBig3
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
	if Input.is_action_just_pressed("esc"):
		if paused:
			closeMap()
		
func _process(delta):
	input_map()

func _on_ajloun_pressed():
	$AudioStreamPlayer.play()
	if(GameManager.money < 4):
		popMessage.visible = true
	else:
		GameManager.set_jump(-450)
		GameManager.sub_money(4)
		await get_tree().create_timer(1.0).timeout
		money_display.sub_money()
		GameManager.isDefault = true
		GameManager.scene = "res://levels/ajloun/ajloun.tscn"
		get_tree().change_scene_to_file("res://levels/ajloun/ajloun.tscn")
	
func _on_jarash_pressed():
	$AudioStreamPlayer.play()
	
	if(GameManager.money < 5):
		popMessage.visible = true
	else:
		GameManager.set_jump(-550)
		GameManager.sub_money(5)
		await get_tree().create_timer(1.0).timeout
		money_display.sub_money()
		GameManager.isDefault = true
		GameManager.scene = "res://levels/jarash/mainJarashScene.tscn"
		get_tree().change_scene_to_file("res://levels/jarash/mainJarashScene.tscn")
	
func _on_petra_pressed():
	$AudioStreamPlayer.play()
	if(GameManager.money < 6):
		popMessage.visible = true
	else:
		GameManager.set_jump(-550)
		GameManager.sub_money(6)
		await get_tree().create_timer(1.0).timeout
		money_display.sub_money()
		GameManager.isDefault = true
		GameManager.scene = "res://levels/Petra/mainPetra.tscn"
		get_tree().change_scene_to_file("res://levels/Petra/mainPetra.tscn")


func _on_button_pressed():
	popMessage.visible = false


func _on_ready():
	if GameManager.isTutorial:
		$popupMessage2.visible = true
	if GameManager.jarashKey:
		key1.visible = true
	if GameManager.ajlounKey:
		key2.visible = true
	if GameManager.petraKey:
		key3.visible = true


func _on_button_tutorial_pressed():
	GameManager.isTutorial = false
	$popupMessage2.visible = false
