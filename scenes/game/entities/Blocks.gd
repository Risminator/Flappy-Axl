extends CharacterBody2D

@export var speed:float = 200

func _physics_process(delta):
	velocity = Vector2(-speed, 0)
	move_and_slide()
	
	var collision_count = get_slide_collision_count()
	for i in collision_count:
		var collision_info = get_slide_collision(i)
		var collider = collision_info.get_collider()
		
		if collider.has_method("get_hit"):
			collider.get_hit()
