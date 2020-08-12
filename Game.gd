extends Node2D

# Selected playable character
export var active_character = "Robson"

# Party characters statuses
var party = {
	"Robson": {
		"stats": 0
	},
	"Marina": {
		"stats": 0
	}
}

# On every step
func _process(delta):
	if Input.is_action_just_pressed("test_select_char_1"):
		active_character = "Robson"
	elif Input.is_action_just_pressed("test_select_char_2"):
		active_character = "Marina"
