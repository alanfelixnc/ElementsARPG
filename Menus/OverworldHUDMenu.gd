extends CanvasLayer

# Signals when saving the game
signal save_game

# On buttom SaveGame pressed
func _on_SaveGame_pressed():
	emit_signal("save_game")
