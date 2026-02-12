extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if !Globals.check_level():
			Globals.levelNum += 1
			Globals.unlock_level()
		get_tree().change_scene_to_file("res://scenes/level_select.tscn")
