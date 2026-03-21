extends TextureButton

@export var level_id: String = ""
@export var level_theme: String = ""
@onready var popup: PopupPanel = $PopupPanel
@onready var level: Label = $PopupPanel/VBoxContainer/Level
@onready var food: Label = $PopupPanel/VBoxContainer/Food
@onready var state: Label = $PopupPanel/VBoxContainer/State


func _ready() -> void:
	update()
	self.scale = Vector2(4, 4)
	setTexture()
	setLabels()

func setLabels():
	level.text = level_id.replace("_", " ").capitalize()
	food.text = "- " + level_theme.capitalize()
	if Globals.levels[level_id]:
		state.text = "- Unlocked"
	else:
		state.text = "- Locked"
	
func update():
	if Globals.levels.get(level_id):
		disabled = false
	else:
		disabled = true

func setTexture():
	self.texture_normal = load("res://assets/sprites/" + level_id + "_button.png")
	self.texture_hover = load("res://assets/sprites/" + level_id + "_button_hover.png")

func setPopUpPos():
	if popup.visible:
		popup.position = Vector2(get_viewport().get_mouse_position())
