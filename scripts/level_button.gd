extends TextureButton

@export var level_id: String = ""
@export var unlocked: bool = false


func _ready() -> void:
	update()
		
func update():
	if not unlocked:
		disabled = true
		#set texture
	else:
		disabled = false
		#set texture
