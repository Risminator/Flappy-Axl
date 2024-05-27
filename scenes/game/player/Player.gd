extends CharacterBody2D

const JUMP_VELOCITY = -450.0
const JUMP_TIME_INTERVAL = 500
const MAX_DEGREE_TURN = 90 
const MIN_DEGREE_TURN = -30
const ROTATION_SPEED = 2 

signal player_dead

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_time = 0
var time_now = 0

var is_active = false

func jump():
	velocity.y = JUMP_VELOCITY
	rotation_degrees = MIN_DEGREE_TURN
	jump_time = Time.get_ticks_msec()
	$AnimationHop.play("hop")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor() and is_active:
		velocity.y += gravity * delta
		time_now = Time.get_ticks_msec()
		if time_now - jump_time >= JUMP_TIME_INTERVAL:
			if rotation_degrees < MAX_DEGREE_TURN:
				rotation_degrees += ROTATION_SPEED

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_active:
		jump()
		
	move_and_slide()
	for i in get_slide_collision_count():
		var collider = get_slide_collision(i).get_collider()
		if  collider.get_collision_layer() == 2:
			player_dead.emit()
			#queue_free()


func _on_world_mode_changed():
	var world = get_parent()
	match world.cur_mode:
		world.MODES.MENU:
			is_active = false
			get_tree().reload_current_scene()
		world.MODES.INGAME:
			is_active = true
			jump()
		world.MODES.DEATH:
			is_active = false


func _on_player_dead():
	velocity.y = 500
