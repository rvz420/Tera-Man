extends Area2D

const SCREEN_WIDTH = 320
export var MOVE_SPEED = 500.0
var dir = 1

func _process(delta):
	
	position += Vector2(dir * MOVE_SPEED * delta, 0.0)
	if position.x >= SCREEN_WIDTH + 8:
		queue_free()

func _on_shot_area_entered(area):
	if area.is_in_group("asteroid"):
		queue_free()

func set_dir(dir):
	self.dir = dir