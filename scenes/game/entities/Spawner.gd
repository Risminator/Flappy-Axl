extends Marker2D

@export var spawn_interval_min:float = 1.25
@export var spawn_interval_max:float = 2
@export var vertical_interval_max:float = 400

var previous_pipe_y = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func spawn():
	var pipe_scene = load("res://scenes/game/entities/blocks_new.tscn")
	var new_pipe = pipe_scene.instantiate()
	var new_y = previous_pipe_y + randf_range(-vertical_interval_max, vertical_interval_max)
	new_y = min(%Floor.position.y-200, new_y)
	new_y = max(%Roof.position.y+400, new_y)
	new_pipe.position.y = new_y
	add_child(new_pipe)
	
	previous_pipe_y = new_pipe.position.y
	
	get_tree().create_timer(randf_range(spawn_interval_min, spawn_interval_max)).timeout.connect(spawn)
