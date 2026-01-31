extends Node2D

@onready var sprite: Sprite2D = $StaticBody2D/Sprite2D
@export var texture: Texture2D
@export var disable = false
@onready var collision: CollisionShape2D = $StaticBody2D/CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.texture = texture
	collision.disabled = disable
	
