extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	Globals.money += 1
	print(Globals.money)
	self.queue_free()
