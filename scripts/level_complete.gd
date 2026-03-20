extends CanvasLayer

func _on_return_pressed() -> void:
	print("return pressed")
	get_tree().paused = false
	Globals.win = false
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
