extends Node


var money = 0

func add_money(amount):
	money += amount
	
func sub_money(amount):
	money -= amount
	
var defaultPlayerPosition : Vector2 = Vector2(300, 400)
var playerPosition = defaultPlayerPosition

func get_default_player_position() -> Vector2:
	set_player_position(defaultPlayerPosition)
	return defaultPlayerPosition

func set_player_position(new_position : Vector2):
	playerPosition = new_position
	
func get_player_position() -> Vector2:
	return playerPosition
