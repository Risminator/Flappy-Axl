extends CharacterBody2D

@export var speed:float = 200

func _physics_process(delta):
	velocity = Vector2(-speed, 0)
	move_and_slide()
