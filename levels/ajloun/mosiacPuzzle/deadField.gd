extends TextureRect


@export var fallenTexture : Texture2D
signal pieceHaveFallen

func _can_drop_data(at_position, data):
	return data is Texture2D

func _drop_data(at_position, data):
	fallenTexture = data
	pieceHaveFallen.emit()

