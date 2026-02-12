extends Node

var money: int = 0
var dead: bool = false
var levels = {
	"level_1": true,
	"level_2": false,
}
var levelNum = 1;
var level_ID: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	money = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func unlock_level():
	level_ID = "level_" + str(levelNum)
	levels[level_ID] = true
