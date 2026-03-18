extends Node2D

@onready var ingredient: Node2D = $ingredients

var pos: int = 0
var ingredients = preload("res://scenes/ingredient.tscn")
var item = ingredients.instantiate()

func _ready():
	getPos()
	add_child(item)

func _physics_process(delta: float) -> void:
	#add if statement to check if ingredient is removed or falling
	item.position.x = pos #add to separate function
	item.position.y += 250 * delta

func getPos():
	pos = randi_range(100, 900)

func resetItem(item):
	item.reload()
	getPos()
	item.position.y = -50

func _on_item_boundry_on_ground() -> void:
	resetItem(item)
