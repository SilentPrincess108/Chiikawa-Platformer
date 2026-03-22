extends RigidBody2D

@export var type: String = ""

@onready var half_1: RigidBody2D = $Half1
@onready var half_2: RigidBody2D = $Half2
@onready var sprite: Sprite2D = $Sprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D


func _ready() -> void:
	half_1.hide()
	half_2.hide()

func _on_area_2d_mouse_entered() -> void:
	print("HYAHHHHHHHHH, SLASH!!")
	sprite.hide()
	collision.disabled = true
	setHalves()
	
	half_1.show()
	half_1.position = self.position
	half_2.show()
	half_2.position = self.position

func setHalves():
	half_1.get_node("Sprite2D").texture = load("res://assets/sprites/" + type + "-half1.png")
	half_2.get_node("Sprite2D").texture = load("res://assets/sprites/" + type + "-half2.png")
	print("halves set")
