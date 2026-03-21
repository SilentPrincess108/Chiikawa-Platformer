extends TextureButton

@export var level_id: String = ""

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
