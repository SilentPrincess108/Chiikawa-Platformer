extends Node2D

@onready var sprite: Sprite2D = $Sprite2D

var texture: Texture2D
var textures = ["bread", "cheese", "tomato", "lettuce", "meat-slice"]
var textNum: int = 0

func _ready() -> void:
	genRandTexture()
	

func genRandTexture():
	textNum = randi_range(0, textures.size() - 1)
	texture = load("res://assets/sprites/" + textures[textNum] + ".png")
	sprite.texture = texture


func _on_item_boundry_on_ground() -> void:
	queue_free()
