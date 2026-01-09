extends CharacterBody2D

@export_range(0, 1) var deceleration = 0.3
@export_range(0, 1) var acceleration = 0.3
@export_range(0, 1) var decelerate_on_jump_release = 0.5

const SPEED = 500.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	get_input()

func get_input():
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_released("Jump") and velocity.y < 0:
		velocity.y *= decelerate_on_jump_release

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, SPEED * acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * deceleration)

	move_and_slide()
