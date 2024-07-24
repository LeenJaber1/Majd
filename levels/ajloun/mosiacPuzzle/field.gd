extends TextureRect

signal pieceMoved
signal pieceNotNull
signal pieceReceived

func _get_drag_data(at_position):
	
	var preview_texture = TextureRect.new()
	
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(116, 90)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	set_drag_preview(preview)
	texture = null
	
	pieceMoved.emit(self)
	
	return preview_texture.texture
	
func _can_drop_data(at_position, data):
	return data is Texture2D

func _drop_data(at_position, data):
	if (texture == null):
		texture = data
		pieceReceived.emit()
	else:
		pieceNotNull.emit(texture)
		texture = data
	
func generate(t : Texture2D):
	texture = t
	
