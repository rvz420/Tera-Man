extends "res://entities/player/PlayerState.gd"

func enter():
	player.play_anim("idle")

func update(delta):
	if not player.is_on_floor():
		player.set_state(player.JUMPING)

func handle_input():
	if Input.is_action_pressed("ui_right"):
		player.vel.x = player.run_speed	
		$"../../pivot".scale.x = 1
		player.set_state(player.RUNNING)
	if Input.is_action_pressed("ui_left"):
		player.vel.x = -player.run_speed
		$"../../pivot".scale.x = -1
		player.set_state(player.RUNNING)
	if Input.is_action_just_pressed("a"):
		player.vel.y -= player.jump_speed
		player.set_state(player.JUMPING)

func exit():
	pass
