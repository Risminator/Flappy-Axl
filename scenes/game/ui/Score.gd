extends Label
var num = null
var map = [	Rect2(197, 31, 24, 27),
			Rect2(101, 0, 16, 27),
			Rect2(122, 0, 21, 27),
			Rect2(148, 0, 21, 27),
			Rect2(173, 0, 23, 27),
			Rect2(198, 0, 21, 27),
			Rect2(102, 31, 21, 27),
			Rect2(124, 31, 21, 27),
			Rect2(147, 31, 21, 27),
			Rect2(172, 31, 21, 27)]
var tiles = preload("res://assets/buttons.png")
func _process(delta):
	if (len(get_children()) < 1):
		num = Sprite2D.new()
		num.set_texture(tiles)
		num.set_region_enabled(true)
		num.set_region_rect(map[0])
		add_child(num)
	else:
		get_child(0).set_region_rect(map[Global.score % 10])
