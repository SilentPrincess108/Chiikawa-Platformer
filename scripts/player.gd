extends CharacterBody2D

@export_range(0, 1) var deceleration = 0.3
@export_range(0, 1) var acceleration = 0.3
@export_range(0, 1) var decelerate_on_jump_release = 0.5
@onready var animated_sprite: AnimatedSprite2D = $Sprite2D

const SPEED = 500.0
const JUMP_VELOCITY = -400.0
const JUMP_PAD_HEIGHT = -500.0
const GRAVITY = 1000.0
const FALL_GRAVITY = 1500.0


func _physics_process(delta) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += get_grav(velocity) * delta
	get_input()

func get_grav(velocity: Vector2): #change gravity when jumping and falling
	if velocity.y < 0:
		return GRAVITY
	return FALL_GRAVITY

func get_input():
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	
	#handle animation
	if is_on_floor() and direction:
		animated_sprite.play("walk")
		if direction >= 1:
			animated_sprite.flip_h = false
		else:
			animated_sprite.flip_h = true
	elif not is_on_floor():
		animated_sprite.play("jump")
	else:
		animated_sprite.play("idle")
	
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_released("Jump") and velocity.y < 0:
		velocity.y *= decelerate_on_jump_release
	
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, SPEED * acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * deceleration)

	move_and_slide()
