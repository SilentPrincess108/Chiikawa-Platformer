extends CanvasLayer

func _on_continue_pressed() -> void:
	get_tree().paused = false
	self.hide()


func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
