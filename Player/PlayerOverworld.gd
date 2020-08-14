extends KinematicBody2D

# Movement constants
const ACCELERATION = 800
const MAX_SPEED = 80

# Movement vector
var velocity = Vector2.ZERO

# List of playable characters animations
var player_scenes = {
	"Robson": preload("res://Animations/RobsonAnimation.tscn"),
	"Marina": preload("res://Animations/MarinaAnimation.tscn")
	}

# Active playable character
var active_character = "Robson"

# Animation variables
var animation_player = null
var animation_tree = null
var animation_state = null

# This function loads the active playable character animation
func load_character_animation(character):
	get_tree().call_group("PlayerAnimation", "queue_free")

	var player_scene = player_scenes[character].instance()
	add_child(player_scene)
	animation_player = player_scene.get_child(1)
	animation_tree = player_scene.get_child(2)
	animation_state = animation_tree.get("parameters/playback")

# This function handles the player movement
func move_player(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", input_vector)
		animation_tree.set("parameters/Run/blend_position", input_vector)
		animation_state.travel("Run")
		
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animation_state.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, ACCELERATION * delta)

	velocity = move_and_slide(velocity)

# On ready
func _ready():
	active_character = get_tree().get_root().get_node("Game").active_character
	load_character_animation(active_character)

# On every step
func _process(delta):
	var new_character = get_tree().get_root().get_node("Game").active_character
	if active_character != new_character:
		active_character = new_character
		load_character_animation(active_character)

# On every physics step
func _physics_process(delta):
	move_player(delta)
