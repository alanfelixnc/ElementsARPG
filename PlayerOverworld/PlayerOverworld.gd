extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 80

var velocity = Vector2.ZERO

onready var animationPlayer = $RobsonAnimation/AnimationPlayer
onready var animationTree = $RobsonAnimation/AnimationTree

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, ACCELERATION * delta)

	velocity = move_and_slide(velocity)
