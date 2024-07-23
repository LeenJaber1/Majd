extends Node2D

@onready var generator = $generator
var pictures = [
	"res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/1.png",
	"res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/2.png",
	"res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/3.png",
	"res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/4.png",
	"res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/5.png",
	"res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/6.png",
	"res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/7.png",
	"res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/8.png",
	"res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/9.png",
	"res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/10.png",
	"res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/11.png",
	"res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/12.png",
	"res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/13.png",
	"res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/14.png",
	"res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/15.png",
	"res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/16.png",
	"res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/17.png",
	"res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/18.png",
	"res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/19.png",
	"res://levels/ajloun/mosiacPuzzle/images/imagy-splitted-images/20.png"
]

@onready var pieces = get_tree().get_nodes_in_group("pieces")

func _on_ready():
	for piece in pieces:
		piece.connect("hasPiece", _on_piece_changed)
	generator.texture = getNextPic()
	
func _on_piece_changed():
	generate(getNextPic())
	
func getNextPic() -> Texture2D:
	pictures.shuffle()
	if pictures.size() > 0:
		var current_texture = load(pictures[0])
		pictures.pop_front()
		return current_texture
	else:
		return null
	
func generate(t : Texture2D):
	generator.texture = t

func _on_grid_piece_have_fallen():
	generate($Grid.fallenTexture)

func _on_dead_field_piece_have_fallen():
	generate($DeadField.fallenTexture)

