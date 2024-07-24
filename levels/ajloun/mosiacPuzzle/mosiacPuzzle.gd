extends Node2D

@onready var generator = $generator
var corrcet_pictures = [
	null,
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/1.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/2.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/3.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/4.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/5.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/6.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/7.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/8.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/9.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/10.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/11.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/12.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/13.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/14.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/15.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/16.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/17.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/18.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/19.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/20.png")
]

var pictures = [
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/1.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/2.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/3.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/4.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/5.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/6.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/7.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/8.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/9.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/10.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/11.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/12.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/13.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/14.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/15.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/16.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/17.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/18.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/19.png"),
	load("res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/20.png")
]

@onready var pieces = get_tree().get_nodes_in_group("pieces")
@onready var board_pieces = get_tree().get_nodes_in_group("board_pieces")
var pieces_in_place = 0

func _on_ready():
	print("here")
	for piece in pieces:
		piece.pieceMoved.connect(_on_piece_moved.bind())
		piece.pieceNotNull.connect(_on_piece_not_null.bind())
	for piece in board_pieces:
		piece.pieceReceived.connect(_on_piece_received)
	generate(getNextPic())
	
func _on_piece_moved(sender):
	if sender == $generator:
		pictures.pop_front()
		generate(getNextPic())
	else:
		pieces_in_place -= 1
	
func _on_piece_not_null(piece):
	pictures.insert(0, piece)
	generate(piece)
	
func getNextPic() -> Texture2D:
	pictures.shuffle()
	if pictures.size() > 0:
		var current_texture = pictures[0]
		return current_texture
	else:
		return null
	
func generate(t : Texture2D):
	generator.texture = t

func _on_grid_piece_have_fallen():
	pictures.insert(0, $Grid.fallenTexture)
	generate($Grid.fallenTexture)

func _on_dead_field_piece_have_fallen():
	pictures.insert(0,$DeadField.fallenTexture)
	generate($DeadField.fallenTexture)
	
func _on_piece_received():
	pieces_in_place += 1
	if (pieces_in_place == 20):
		checkForWin()

func checkForWin():
	var counter = 0
	
	for i in range(1, 21):
		if pieces[i].texture == corrcet_pictures[i]:
			counter+= 1
		else:
			pieces[i].texture = null
			pictures.append(corrcet_pictures[i])
			pieces_in_place-=1
	
	if counter == 20:
		$CanvasLayer/popupWinMessage.visible = true
		GameManager.ajlounKey = true
	else:
		generate(getNextPic())
		$CanvasLayer/popupWrongMessage.visible = true

func _on_wrong_button_pressed():
	$CanvasLayer/popupWrongMessage.visible = false

func _on_correct_button_pressed():
	$CanvasLayer/popupWrongMessage.visible = false
	get_tree().change_scene_to_file("res://levels/ajloun/ajloun.tscn")

func _on_button_2_pressed():
		get_tree().change_scene_to_file("res://levels/ajloun/ajloun.tscn")
