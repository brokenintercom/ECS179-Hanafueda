class_name CustomLabel
extends Label

const DEFAULT_TEXT := "None"
const DEFAULT_FONT_SIZE := 38


func reset_and_update_text(new_text:String) -> void:
	reset_text()
	update_text(new_text)


func reset_text() -> void:
	text = DEFAULT_TEXT
	add_theme_font_size_override("font_size", DEFAULT_FONT_SIZE)


func update_text(new_text:String) -> void:
	if text != DEFAULT_TEXT:
		text += ", " + new_text
		
		var font_size = get_theme_font_size("font_size")

		while get_line_count() > 1:
			font_size -= 1
			add_theme_font_size_override("font_size", font_size)
	else:
		text = new_text
