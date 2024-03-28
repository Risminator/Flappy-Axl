extends CharacterBody2D



const JUMP_VELOCITY = -450.0
const JUMP_TIME_INTERVAL = 500
const MAX_DEGREE_TURN = 90 
const MIN_DEGREE_TURN = -30
const ROTATION_SPEED = 2 


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_time = 0
var time_now = 0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		time_now = Time.get_ticks_msec()
		if time_now - jump_time >= JUMP_TIME_INTERVAL:
			if rotation_degrees < MAX_DEGREE_TURN:
				rotation_degrees += ROTATION_SPEED

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
		rotation_degrees = MIN_DEGREE_TURN
		jump_time = Time.get_ticks_msec()
		$AnimationHop.play("hop")

	move_and_slide()
	var collision_count = get_slide_collision_count()
	if collision_count >= 1:
		queue_free()
