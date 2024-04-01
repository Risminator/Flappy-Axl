extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_world_mode_changed():
	var spawner = get_node("Spawner")
	var pipes = spawner.get_children()
	var world = get_parent()
	match world.cur_mode:
		world.MODES.MENU:
			spawner.can_spawn = false
			for pipe in pipes:
				pipe.queue_free()
		world.MODES.INGAME:
			spawner.can_spawn = true
			spawner.spawn()
		world.MODES.DEATH:
			spawner.can_spawn = false
			for pipe in pipes:
				pipe.speed = 0
