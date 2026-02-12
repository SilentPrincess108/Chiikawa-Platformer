extends TextureButton

@export var level_id: String = ""


func _ready() -> void:
	update()
		
func update():
	if Globals.levels.get(level_id):
		disabled = false
	else:
		disabled = true
