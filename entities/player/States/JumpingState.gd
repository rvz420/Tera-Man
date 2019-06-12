extends "res://entities/player/PlayerState.gd"

func enter():
	player.play_anim("jump")

func update(delta):
	if player.vel.y >= 0:
		player.set_state(player.FALLING)

func handle_input():
	if Input.is_action_pressed("ui_right"):
		player.vel.x = player.run_speed	
		player.flip(1)
	if Input.is_action_pressed("ui_left"):
		player.vel.x = -player.run_speed
		player.flip(-1)
	if Input.is_action_just_released("ui_right"):
		player.vel.x = 0
	if Input.is_action_just_released("ui_left"):
		player.vel.x = 0
	if Input.is_action_just_pressed("b"):
		player.set_state(player.JUMPNSHOOTING)

func exit():
	pass