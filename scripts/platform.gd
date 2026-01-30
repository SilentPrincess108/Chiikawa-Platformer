extends Node2D

@onready var timer: Timer = $Timer
@onready var static_body: RigidBody2D = $StaticBody2D


func _ready() -> void:
	static_body.freeze = true

func _on_area_2d_body_entered(_body: CharacterBody2D) -> void:
	print("Player on platform")
	timer.start()

func _on_timer_timeout() -> void:
	static_body.freeze = false
