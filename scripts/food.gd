extends Node2D

@export var type: String = ""
@export var texture: Texture
@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	sprite.texture = texture

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	print("fruit collected!")
	Globals.update_food(type)
