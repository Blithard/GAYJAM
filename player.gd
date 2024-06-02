extends CharacterBody2D

const Movement_speed = 300.0
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("Jump"):
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("Down"):
		velocity.y = -JUMP_VELOCITY

	var direction = Input.get_axis("Left","Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
