extends CanvasLayer

func _on_restart_pressed() -> void:
	print("restart pressed")
	get_tree().paused = false
	Globals.dead = false
	Globals.resetValues()
	get_tree().reload_current_scene()


func _on_back_pressed() -> void:
	print("back pressed")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
