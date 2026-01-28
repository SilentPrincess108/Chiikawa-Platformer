extends Area2D

@onready var boundry: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	boundry.shape.normal = Vector2(-1, 1)
