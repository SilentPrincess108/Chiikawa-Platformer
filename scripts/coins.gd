extends Area2D

@onready var coin_sfx: AudioStreamPlayer = $AudioStreamPlayer

func _on_body_entered(_body: Node2D) -> void:
	Globals.money += 1
	coin_sfx.play()
	print("sfx played!")
	await coin_sfx.finished
	self.queue_free()
