extends TextureButton

@export var level_id: String = ""
@onready var popup: Popup = $Popup


func _ready() -> void:
	update()
	self.scale = Vector2(4, 4)
	setTexture()
		
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
