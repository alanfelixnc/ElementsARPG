extends Node2D

## Player stats ##
# Player's current level
export var player_level = 1
# Player's current XP
export var player_xp = 0
# Player's max XP
export var player_max_xp = 100

## Game base stats ##
# Health
export var base_hp = 50
# Physical Damage
export var base_dmg = 10
# Elemental Damage
export var base_edmg = 5
# Physical Defense
export var base_def = 10
# Elemental Resistance
export var base_res = 5
# Attack Speed
export var base_aspd = 5

## Player's party ##
# Selected character from party
export var active_character = "Robson"
# Party characters status and equips
var party = {
	"Robson": {
		"unlocked": true,
		"special_ability": 0,
		"consumable_a": 0,
		"consumable_b": 0,
		"skill_a": 0,
		"skill_b": 0,
		"skill_c": 0,
		"passive_skill": 0
	},
	"Marina": {
		"unlocked": false,
		"special_ability": 0,
		"consumable_a": 0,
		"consumable_b": 0,
		"skill_a": 0,
		"skill_b": 0,
		"skill_c": 0,
		"passive_skill": 0
	}
}

# On every step
func _process(delta):
	if Input.is_action_just_pressed("test_select_char_1"):
		active_character = "Robson"
	elif Input.is_action_just_pressed("test_select_char_2"):
		active_character = "Marina"
