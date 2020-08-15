extends Node

# PlayerOverworld scene
const PLAYER_OVERWORLD = preload("res://Player/PlayerOverworld.tscn")

# Y Sorter of the map
onready var map_sorter = $YSort

# Player spawn position
onready var spawn_position = $PlayerSpawn

# Adds the player to the map
func add_player_to_map(player, spawn_position):
	var player_overworld = player.instance()
	map_sorter.add_child(player_overworld)
	player_overworld.position = spawn_position.position

# On ready
func _ready():
	add_player_to_map(PLAYER_OVERWORLD, spawn_position)
