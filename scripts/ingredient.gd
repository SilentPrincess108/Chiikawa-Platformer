extends Node2D

@onready var sprite: Sprite2D = $Sprite2D

var texture: Texture2D
var textures = ["bread", "cheese", "tomato", "lettuce", "meat-slice"]
var textNum: int = 0
var type: String = ""

func _ready() -> void:
	genRandTexture()
	position.y = -50
	
func reload():
	genRandTexture()

func genRandTexture():
	textNum = randi_range(0, textures.size() - 1)
	texture = load("res://assets/sprites/" + textures[textNum] + ".png")
	sprite.texture = texture
	type = textures[textNum]

func _on_item_boundry_on_ground() -> void:
	queue_free()
