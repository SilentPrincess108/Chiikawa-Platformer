extends Area2D
signal on_ground

func _on_area_entered(_area: Area2D) -> void:
	#print("ingredient entered")
	on_ground.emit()
