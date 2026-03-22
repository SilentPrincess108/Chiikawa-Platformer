extends Node2D

@onready var timer: Timer = $Timer

var scene = preload("res://scenes/fruit.tscn")
var fruits = ["apple", "banana", "cherry", "orange", "strawberry", "watermelon"]
var x_pos: int = 0
var y_pos: int = 0

func _ready() -> void:
	genPos()
	spawnBurst()

func _physics_process(_delta: float) -> void:
	pass

func genPos():
	x_pos = randi_range(100, 900)
	y_pos = 750
	print("X: " + str(x_pos))
	print("Y: " + str(y_pos))

func genFruitTexture(fruit):
	var textNum = randi_range(0, 5)
	fruit.get_node("Sprite2D").texture = load("res://assets/sprites/" + str(fruits[textNum]) + ".png")
	fruit.type = fruits[textNum]

func scaleFruit(fruit):
	#scaling main sprite
	fruit.get_node("Sprite2D").scale = Vector2(2.5, 2.5)
	fruit.get_node("CollisionShape2D").scale = Vector2(2.5, 2.5)
	fruit.get_node("Area2D/CollisionShape2D2").scale = Vector2(2.5, 2.5)
	
	#scaling halves
	fruit.get_node("Half1/Sprite2D").scale = Vector2(2.5, 2.5)
	fruit.get_node("Half2/Sprite2D").scale = Vector2(2.5, 2.5)

func spawnFruit():
	genPos()
	var fruit = scene.instantiate()
	genFruitTexture(fruit)
	add_child(fruit)
	
	scaleFruit(fruit)
	
	#pos
	fruit.position.x = x_pos
	fruit.position.y = y_pos
	
	#forces
	var up_force = randi_range(-1000, -1250)
	var side_force
	if x_pos < 500:
		side_force = randi_range(0, 200)
	elif x_pos > 500:
		side_force = randi_range(-200, 0)
	fruit.linear_velocity = Vector2(side_force, up_force)

func spawnBurst():
	var count = randi_range(1, 5)
	for num in range(count):
		spawnFruit()
	timer.start()
	

func _on_timer_timeout() -> void:
	spawnBurst()
