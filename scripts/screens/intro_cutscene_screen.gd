extends Node2D

	
func _on_skip_button_pressed() -> void:
	TransitionScreen.transition()
	await signals.on_transition_finished
	signals.switch_scene.emit("battle_screen")


func _on_cutscene_finished() -> void:
	signals.switch_scene.emit("battle_screen")
