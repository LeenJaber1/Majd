extends Control

@onready var label = $Label
@onready var money = GameManager.money

func _on_ready():
	label.text = str(money)

func _process(delta):
	if(money < GameManager.money):
		money = GameManager.money
		add_money()
		
	elif (money > GameManager.money):
		money = GameManager.money
		sub_money()
		
func add_money():
	label.add_theme_color_override("font_color", Color.FOREST_GREEN)
	label.text = str(money)
	label.add_theme_color_override("font_color", Color.WHITE)
	
func sub_money():
	label.add_theme_color_override("font_color", Color.DARK_RED)
	label.text = str(money)
	$losingMoneyAudio.play()
	await $losingMoneyAudio.finished
	label.add_theme_color_override("font_color", Color.WHITE)
	
