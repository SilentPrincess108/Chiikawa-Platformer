extends Node2D

@onready var animation: AnimationPlayer = $Sprite2D/AnimationPlayer


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get("JUMP_VELOCITY"):
		body.velocity.y = body.JUMP_PAD_HEIGHT
		animation.play("bounce")
		
