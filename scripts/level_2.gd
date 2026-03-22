extends Node2D

var scene = preload("res://scenes/fruit.tscn")
var x_pos: int = 0
var y_pos: int = 0
var fruit = scene.instantiate()

func _ready() -> void:
	genPos()
	spawnFruit()

func _physics_process(_delta: float) -> void:
	pass

func genPos():
	x_pos = randi_range(100, 900)
	y_pos = 750
	print("X: " + str(x_pos))
	print("Y: " + str(y_pos))

func spawnFruit():
	#fruit.position = Vector2(350, 350)
	fruit.position.x = 0
	fruit.position.y = 0
	#var up_force = randi_range(-300, -500)
	#var side_force
	#if x_pos < 500:
		#side_force = randi_range(0, 300)
	#elif x_pos > 500:
		#side_force = randi_range(-300, 0)
	#fruit.linear_velocity = Vector2(side_force, up_force)
