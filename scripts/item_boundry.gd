extends Area2D
signal on_ground

func _on_body_entered(body: Node2D) -> void:
	if body.name == "ingredient":
		print("ingredient entered")
		on_ground.emit()
