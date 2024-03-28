extends Area2D

var _player = null

func body_entered(bodies):
	if (len(bodies) >= 1):
		_player = bodies[0]

func body_exited():
	_player = null
	Global.score += 1

func _process(_delta):
	if (has_overlapping_bodies()):
		body_entered(get_overlapping_bodies())
	if (!has_overlapping_bodies() and (_player != null)):
		body_exited()
