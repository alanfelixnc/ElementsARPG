extends Node2D

# PlayerOverworld scene
const PLAYER_OVERWORLD = preload("res://Player/PlayerOverworld.tscn")

# Y Sorter of the map
onready var map_sorter = $YSort

# Adds the player to the map
func add_player_to_map(player):
	var player_overworld = player.instance()
	map_sorter.add_child(player_overworld)

# On ready
func _ready():
	add_player_to_map(PLAYER_OVERWORLD)
