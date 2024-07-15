extends Node2D
@onready var button1 = $button1
@onready var button2 = $button2
@onready var button3 = $button3
@onready var button4 = $button4
@onready var button5 = $button5
@onready var button6 = $button6
@onready var chest = $chest
@onready var key = $key


func _on_button_1_toggled(toggled_on):
	if toggled_on:
		$"button1/AudioStreamPlayer2D".play()
	else:
		$"button1/AudioStreamPlayer2D".stop()



func _on2__toggled(toggled_on):
	if toggled_on:
		$"button2/AudioStreamPlayer2D".play()
	else:
		$"button2/AudioStreamPlayer2D".stop()


func _on3__toggled(toggled_on):
	if toggled_on:
		$"button3/AudioStreamPlayer2D".play()
	else:
		$"button3/AudioStreamPlayer2D".stop()


func _on4__toggled(toggled_on):
	if toggled_on:
		$"button4/AudioStreamPlayer2D".play()
	else:
		$"button4/AudioStreamPlayer2D".stop()


func _on5__toggled(toggled_on):
	if toggled_on:
		$"button5/AudioStreamPlayer2D".play()
	else:
		$"button5/AudioStreamPlayer2D".stop()


func _on6__toggled(toggled_on):
	if toggled_on:
		$"button6/AudioStreamPlayer2D".play()
	else:
		$"button6/AudioStreamPlayer2D".stop()



func _on_submit_pressed():
	if button2.button_pressed and button4.button_pressed and button5.button_pressed:
		chest.play("opening")
		$"submit/opening".play()
		key.visible = true
		key.play("default")
		
		#then go back to scene and add key
	else:
		button1.button_pressed = false
		button2.button_pressed = false
		button3.button_pressed = false
		button4.button_pressed = false
		button5.button_pressed = false
		button6.button_pressed = false
		$"submit/locked".play()
	

