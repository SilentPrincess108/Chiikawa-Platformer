extends Node2D

@onready var sprite: AnimatedSprite2D = $Sprite2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get("JUMP_VELOCITY"):
		body.velocity.y = body.JUMP_PAD_HEIGHT
		sprite.play("bounce")
		
