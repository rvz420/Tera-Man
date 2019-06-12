extends "res://entities/player/PlayerState.gd"

func enter():
	player.vel.x = player.run_speed	* player.dir
	player.play_anim("run")

func update(delta):
	if not player.is_on_floor():
		player.set_state(player.FALLING)

func handle_input():
	if Input.is_action_just_released("ui_right"):
		player.set_state(player.IDLE)
	if Input.is_action_just_released("ui_left"):
		player.set_state(player.IDLE)
	if Input.is_action_just_pressed("a"):
		player.vel.y -= player.jump_speed
		player.set_state(player.JUMPING)
	if Input.is_action_just_pressed("b"):
		player.set_state(player.SHOOTING)

func exit():
	pass