extends Node2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var pos: float

func _ready() -> void:
	pos = position.x
	print(pos)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.death()

func _process(_delta: float) -> void:
	if position.x < pos:
		sprite.flip_h = false
	elif position.x > pos:
		sprite.flip_h = true
	pos = position.x
