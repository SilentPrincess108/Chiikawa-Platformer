extends Node2D

@onready var ingredient: Node2D = $ingredients
@onready var player: CharacterBody2D = $Player
@onready var plate: Area2D = $Player/plate
@onready var score: Label = $HUD/Score
@onready var lives: Label = $HUD/Lives
@onready var next: Label = $HUD/Next
@onready var hud: CanvasLayer = $HUD
@onready var game_over: CanvasLayer = $game_over



@onready var itemBox: HBoxContainer = $HUD/Items
@onready var item1: TextureRect = $HUD/Items/item1
@onready var item2: TextureRect = $HUD/Items/item2
@onready var item3: TextureRect = $HUD/Items/item3
@onready var item4: TextureRect = $HUD/Items/item4
@onready var item5: TextureRect = $HUD/Items/item5

@onready var items = [item1, item2, item3, item4, item5]

@onready var timer: Timer = $Timer

var pos: int = 0
var ingredients = preload("res://scenes/ingredient.tscn")
var item = ingredients.instantiate()

var numItems: int = 0
var itemTypes = ["bread", "cheese", "tomato", "lettuce", "meat-slice"]
var sandoCombo = {}
var comboComplete: bool = false
var rounds: int = 5
	
func _ready():
	getPos()
	add_child(item)
	setItems()
	printCombo()
	next.hide()
	game_over.hide()
	

func _physics_process(delta: float) -> void:
	#add if statement to check if ingredient is removed or falling
	item.position.x = pos #add to separate function
	item.position.y += 250 * delta
	score.text = "Score: " + str(Globals.points)
	lives.text = "Lives: " + str(Globals.lives)
	if Globals.dead:
		get_tree().paused = true
		hud.hide()
		game_over.show()
		

func getPos():
	pos = randi_range(100, 900)
	
func genNumItems():
	numItems = randi_range(1, 4)

func setItems():
	genNumItems()
	sandoCombo[itemTypes[0]] = false
	for num in range(numItems):
		sandoCombo[itemTypes[randi_range(1, 4)]] = false
	
	#set hud element
	var itemCount = 0
	for key in sandoCombo:
		items[itemCount].texture = load("res://assets/sprites/" + key + ".png")
		itemCount += 1

func printCombo():
	for key in sandoCombo:
		print(key + ": " + str(sandoCombo[key]))
	print("")

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
	if sandoCombo.has(item.type):
		if sandoCombo[item.type] == false:
			Globals.points += 5
			sandoCombo[item.type] = true
			
			for num in range(sandoCombo.size()):
				if items[num].texture == item.texture:
					items[num].texture = load("res://assets/sprites/" + item.type + "-check.png")
					break
		else:
			Globals.lives -= 1
	else:
		Globals.lives -= 1
	
	if Globals.lives == 0:
		Globals.dead = true
		player.death()

	checkCombo()
	if comboComplete:
		nextRound()

func checkCombo():
	for key in sandoCombo:
		if sandoCombo[key] == false:
			print("incomplete combo")
			return
	print("combo complete")
	comboComplete = true
	
func nextRound():
	itemBox.hide()
	comboComplete = false
	sandoCombo.clear()
	for e in range(items.size()):
		items[e].texture = null
	setItems()
	next.show()
	timer.start()
	rounds -= 1

func _on_timer_timeout() -> void:
	next.hide()
	itemBox.show()

#this code is lwk making me go inside. I'm rlly rlly bored of
#this project. I'm rlly only completing it for the sake of completing
#it because I have a habit of starting projects and then abandoning them.
#How do I make this more exciting? Idk, I'm trying to enjoy the process
#but the process of making smth I'm not entirely interested in isn't exactly
#enjoyable. Ik that by doing this, I'm giving myself more experience with godot and
#whatever but I'd so much rather start making smth else. Writing this as a reflection ig,
#but I know I just gotta push through. I need to actually make smth complete for once.
#After a break, I'm going to try and fix this bug. Once it's fixed, I'll move onto adding
#difficulty to this level and polishing it. Then it should be finished!
