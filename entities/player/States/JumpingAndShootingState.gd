extends "res://entities/player/PlayerState.gd"

var time = 0

func enter():
	player.play_anim("jump_shoot")

func update(delta):
	time += delta 
	if time >0.8:
		player.set_state(player.JUMPING)
	if player.is_on_floor():
		player.set_state(player.IDLE)
	
func handle_input():
	if Input.is_action_pressed("ui_right"):
		player.vel.x = player.run_speed	
		$"../../pivot".scale.x = 1
	if Input.is_action_pressed("ui_left"):
		player.vel.x = -player.run_speed
		$"../../pivot".scale.x = -1
	if Input.is_action_just_released("ui_right"):
		player.vel.x = 0
	if Input.is_action_just_released("ui_left"):
		player.vel.x = 0

func exit():
	time = 0
