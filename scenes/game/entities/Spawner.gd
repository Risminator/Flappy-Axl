extends Marker2D

@export var spawn_interval_min:float = 1
@export var spawn_interval_max:float = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func spawn():
	var pipe_scene = preload("res://scenes/game/entities/blocks.tscn")
	var new_pipe = pipe_scene.instantiate()
	
	new_pipe.position = new_pipe.position + Vector2(0, randf_range(-200, 200))
	add_child(new_pipe)
	
	get_tree().create_timer(randf_range(spawn_interval_min, spawn_interval_max)).timeout.connect(spawn)
