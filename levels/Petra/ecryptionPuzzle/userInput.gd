extends Control

var text_label: Label # Reference a Label node for displaying text
var stylebox_custom: StyleBoxFlat # Reference a custom StyleBox with color and opacity

func _ready():
	text_label = Label.new()
	add_child(text_label)
	text_label.rect_scale = Vector2(1, 1) # Ensure Label fills the Control

	# Create a custom StyleBox with desired color and opacity
	stylebox_custom = StyleBoxFlat.new()
	stylebox_custom.background_color = Color(1, 1, 1, 0.5) # Adjust color (red, green, blue, alpha) for desired background and opacity

	set_style_box(stylebox_custom) # Set the custom stylebox

