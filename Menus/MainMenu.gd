extends Node2D

# Signals when starting a new game
signal start_new_game

# On button NewGame pressed
func _on_NewGame_pressed():
	emit_signal("start_new_game")
