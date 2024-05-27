extends Node2D

@onready var lost_label: Label = $CanvasLayer/Label
@onready var start_label: Label = $CanvasLayer/Label2

const MODES = {
	MENU = 0,
	INGAME = 1,
	DEATH = 2
}

signal mode_changed

var cur_mode = MODES.MENU

var player = preload("res://scenes/game/player/player.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		match cur_mode:
			MODES.MENU:
				cur_mode = MODES.INGAME
				start_label.visible = false
				mode_changed.emit()
			MODES.DEATH:
				cur_mode = MODES.MENU
				mode_changed.emit()
				
	print(cur_mode)


func _on_player_player_dead():
	cur_mode = MODES.DEATH
	lost_label.visible = true
	mode_changed.emit()


func _on_mode_changed():
	if cur_mode == MODES.MENU:
		
		Global.score = 0
