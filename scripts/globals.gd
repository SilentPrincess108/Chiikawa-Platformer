extends Node

var money: int = 0 #implement level money; separate from total money
var dead: bool = false #player state

var levels = { #dict. to keep track of locked/unlocked levels
	"level_1": true,
	"level_2": false,
}

var foods = {
	"apple":false,
	"strawberry":false,
	"grapes":false,
	"watermelon":false
}

var levelNum = 1; #keep track of level
var level_ID: String = "" #string to identify level

func _ready() -> void:
	money = 0
	
#function to update the lock state of a level
func unlock_level():
	level_ID = "level_" + str(levelNum)
	levels[level_ID] = true

func update_food(name: String):
	foods[name] = true

#function to check if level is unlocked;
#to prevent level num increasing after replaying a level
func check_level():
	#TEST WHEN OTHER LEVELS ARE IMPLEMENTED
	level_ID = "level_" + str(levelNum)
	if (levels[level_ID]):
		return false
	return true
