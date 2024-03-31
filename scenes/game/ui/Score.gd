extends Label
var num = null
var num2 = null
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
func _process(_delta): 
	if (Global.score < 10):
		if (len(get_children()) < 1):
			num = Sprite2D.new()
			num.set_texture(tiles)
			num.set_region_enabled(true)
			num.set_region_rect(map[0])
			add_child(num)
		else:
			get_child(0).set_region_rect(map[Global.score % 10])
	elif (Global.score < 100):
		if (len(get_children()) < 2):
			get_child(0).set_region_rect(map[Global.score % 10])
			num = Sprite2D.new()
			get_children()[0].set_offset(Vector2(get_children()[0].get_region_rect().size.x/2, 0))
			num.set_offset(Vector2(-get_children()[0].get_region_rect().size.x/2, 0))
			num.set_texture(tiles)
			num.set_region_enabled(true)
			num.set_region_rect(map[1])
			add_child(num)
		else:
			get_child(0).set_region_rect(map[Global.score % 10])
			get_child(1).set_region_rect(map[(Global.score % 100) / 10])
	
			
	
	
