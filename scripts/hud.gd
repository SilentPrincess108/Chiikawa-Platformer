extends CanvasLayer

@onready var coins: Label = $coins


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	coins.text = "Coins: " + str(Globals.money)
