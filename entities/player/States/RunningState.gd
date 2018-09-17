extends "res://entities/player/PlayerState.gd"

func enter():
	player.play_anim("run")

func update(delta):
	if not player.is_on_floor():
		player.set_state(player.JUMPING)

func handle_input():
	if Input.is_action_just_released("ui_right"):
		player.vel.x = 0
		player.set_state(player.IDLE)
	if Input.is_action_just_released("ui_left"):
		player.vel.x = 0
		player.set_state(player.IDLE)
	if Input.is_action_just_pressed("a"):
		player.vel.y -= player.jump_speed
		player.set_state(player.JUMPING)

func exit():
	pass