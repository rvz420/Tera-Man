extends "res://entities/player/PlayerState.gd"

func enter():
	player.play_anim("idle")

func update(delta):
	player.vel.x = lerp(player.vel.x,0,1)
	if not player.is_on_floor():
		player.set_state(player.FALLING)

func handle_input():
	if Input.is_action_pressed("ui_right"):
		player.flip(1)
		player.set_state(player.RUNNING)
	if Input.is_action_pressed("ui_left"):
		player.flip(-1)
		player.set_state(player.RUNNING)
	if Input.is_action_just_pressed("a"):
		player.vel.y -= player.jump_speed
		player.set_state(player.JUMPING)
	if Input.is_action_just_pressed("b"):
		player.set_state(player.SHOOTING)

func exit():
	pass
