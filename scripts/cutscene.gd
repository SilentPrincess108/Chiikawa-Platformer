extends Node

@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
