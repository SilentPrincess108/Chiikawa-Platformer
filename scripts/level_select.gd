extends Node2D



func _on_level_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")


func _on_level_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")
