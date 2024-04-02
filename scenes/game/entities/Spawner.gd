extends Marker2D

@export var spawn_interval_min:float = 1.5
@export var spawn_interval_max:float = 1.5
@export var spawn_speed:float = 300
@export var vertical_interval_max:float = 540
@export var can_spawn = false

var floor_offset = -800
var roof_offset = 150

var previous_pipe_y = 0
var i = 0
var kspeed = 1
var ktime = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print(%Floor.position.y + floor_offset, %Roof.position.y + roof_offset)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func spawn():
	var pipe_scene = load("res://scenes/game/entities/blocks_new.tscn")
	var new_pipe = pipe_scene.instantiate()
	var new_y = randf_range(-vertical_interval_max, vertical_interval_max)
	#var new_y = %Floor.position.y + floor_offset

	print("OLD:", new_y)
	"""
	if previous_pipe_y not in [%Roof.position.y, %Floor.position.y]:
		new_y = previous_pipe_y + randf_range(-vertical_interval_max, vertical_interval_max)
	else:
		new_y = 540 + randf_range(-vertical_interval_max, vertical_interval_max)"""

	new_y = min(%Floor.position.y + floor_offset, new_y)
	new_y = max(%Roof.position.y + roof_offset, new_y)

	print("NEW:", new_y)

	new_pipe.position.y = new_y
	new_pipe.speed = spawn_speed * kspeed

	var interval_min = spawn_interval_min - ktime
	var interval_max = spawn_interval_max - ktime
	add_child(new_pipe)

	previous_pipe_y = new_pipe.position.y
	i += 1
	if kspeed <= 2:
		kspeed += i * 0.01
	if ktime >= 0.3:
		ktime -= i * 0.0015
		
	#new_pipe.speed = 600
	#spawn_interval_min = 1.2
	#spawn_interval_max = 1.2
	if can_spawn:
		get_tree().create_timer(randf_range(interval_min, interval_max)).timeout.connect(spawn)
