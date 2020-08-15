extends Node2D

# Signals when starting a new game
signal start_new_game

# Signals when loading the game
signal continue_previous_game

# On button NewGame pressed
func _on_NewGame_pressed():
	emit_signal("start_new_game")

# On button LoadGame pressed
func _on_LoadGame_pressed():
	emit_signal("continue_previous_game")
