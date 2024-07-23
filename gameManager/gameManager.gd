extends Node

var JarashHintStatus  = 0
var PetraHintStatus  = 0
var AjlounHintStatus  = 0

var jarashKey  = 0
var petraKey  = 0
var ajlounKey  = 0

var ajlounPuzzleSolved = false

var ajlounPuzzleSolved = false

var money = 0

var scene = ""

func add_money(amount):
	money += amount
	
func sub_money(amount):
	money -= amount
	
var defaultPlayerPosition : Vector2 = Vector2(300, 400)
var playerPosition = defaultPlayerPosition
var isDefault = true

func get_default_player_position() -> Vector2:
	set_player_position(defaultPlayerPosition)
	return defaultPlayerPosition

func set_player_position(new_position : Vector2):
	playerPosition = new_position
	
func get_player_position() -> Vector2:
	return playerPosition
