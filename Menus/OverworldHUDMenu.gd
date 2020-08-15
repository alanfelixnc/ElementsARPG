extends CanvasLayer

# Game paused state
onready var game_paused = false

# Save game button
onready var HUDButton = $SaveGame

# Signals when saving the game
signal save_game

# On button SaveGame pressed
func _on_SaveGame_pressed():
	emit_signal("save_game")

# Show and hide HUD menu
func show_hud_menu(show):
	if show:
		HUDButton.show()
	else:
		HUDButton.hide()

# On ready
func _ready():
	game_paused = get_tree().paused
	show_hud_menu(game_paused)

# On every step
func _physics_process(delta):
	# Pauses and unpauses the game
	if Input.is_action_just_pressed("game_pause"):
		if !game_paused:
			get_tree().paused = true
		else:
			get_tree().paused = false
		game_paused = get_tree().paused
		show_hud_menu(game_paused)
