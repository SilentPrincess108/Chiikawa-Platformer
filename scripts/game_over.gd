extends Node2D

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
