extends Node2D

@onready var ingredient: Node2D = $ingredient

var pos: int = 0
var ingredients = preload("res://scenes/ingredient.tscn")

func _ready():
	setPos()
	var instance = ingredients.instantiate()
	add_child(instance)
	instance.position = Vector2(pos, -50)

func setPos():
	pos = randi_range(100, 900)
