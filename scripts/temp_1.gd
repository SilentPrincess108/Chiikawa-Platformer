extends Node2D

@onready var ingredient: Node2D = $ingredients
@onready var player: CharacterBody2D = $Player
@onready var plate: Area2D = $Player/plate
@onready var score: Label = $HUD/Score
@onready var lives: Label = $HUD/Lives


var pos: int = 0
var ingredients = preload("res://scenes/ingredient.tscn")
var item = ingredients.instantiate()

var numItems: int = 0
var itemTypes = ["bread", "cheese", "tomato", "lettuce", "meat-slice"]
var sandoCombo = {}

func _ready():
	getPos()
	add_child(item)
	setItems()
	printCombo()
	

func _physics_process(delta: float) -> void:
	#add if statement to check if ingredient is removed or falling
	item.position.x = pos #add to separate function
	item.position.y += 250 * delta
	score.text = "Score: " + str(Globals.points)
	lives.text = "Lives: " + str(Globals.lives)

func getPos():
	pos = randi_range(100, 900)
	
func genNumItems():
	numItems = randi_range(1, 4)

func setItems():
	genNumItems()
	sandoCombo[itemTypes[0]] = false
	for num in range(numItems):
		sandoCombo[itemTypes[randi_range(1, 4)]] = false

func printCombo():
	for key in sandoCombo:
		print(key + ": " + str(sandoCombo[key]))

func resetItem(item):
	item.reload()
	getPos()
	item.position.y = -50

func _on_item_boundry_on_ground() -> void:
	resetItem(item)

func _on_plate_area_entered(area: Area2D) -> void:
	#print("ingredient collected")
	checkItem(item)
	resetItem(item)

func checkItem(item):
	for items in sandoCombo:
		if sandoCombo[items]:
			continue
		else:
			if item.type == items:
				sandoCombo[items] = true
				Globals.points += 5
	printCombo()
