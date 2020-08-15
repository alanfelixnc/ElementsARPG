extends Node2D

# Main menu scene
var main_menu_scene = preload("res://Menus/MainMenu.tscn")

# Lumina Village scene
var lumina_village_scene = preload("res://Maps/LuminaVillage.tscn")

# Overworld HUD scene
var overworld_hud_scene = preload("res://Menus/OverworldHUDMenu.tscn")

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

## Player's inventory ##
var inventory = {
	"skills": [
		[1, 23] # 1 = skill index, 23 = skill amount
	],
	"consumables": [
		[1, 23]
	]
}

# Stores game data
func save_game_data():
	print("Generating save data...")
	var save_dict = {
		"player_level": player_level,
		"player_xp": player_xp,
		"player_max_xp": player_max_xp,
		"active_character": active_character,
		"party": party,
		"inventory": inventory		
	}
	return save_dict

# On save
func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	var save_data = save_game_data()
	save_game.store_line(to_json(save_data))
	save_game.close()
	print("Game saved!")

# On ready
func _ready():
	var main_menu = main_menu_scene.instance()
	add_child(main_menu)
	main_menu.connect("start_new_game", self, "start_new_game")

# On start of a new game
func start_new_game():
	var main_menu = $MainMenu
	main_menu.queue_free()
	var lumina_village = lumina_village_scene.instance()
	add_child(lumina_village)
	var overworld_hud = overworld_hud_scene.instance()
	add_child(overworld_hud)
	overworld_hud.connect("save_game", self, "save_game")

# On every step
func _process(delta):
	if Input.is_action_just_pressed("test_select_char_1"):
		active_character = "Robson"
	elif Input.is_action_just_pressed("test_select_char_2"):
		active_character = "Marina"
