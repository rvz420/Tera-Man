extends "res://entities/player/PlayerState.gd"

var shot_scene = preload("res://entities/player/Weapons/normal_shoot.tscn")
var shoots = 2
var time = 0
var stage_node
var shot_instance
var shoot_position
	
func enter():
	stage_node = get_parent().get_parent()
	shot_instance = shot_scene.instance()
	shoot_position = $"../../pivot/spawn_shoot".position
	shot_instance.position = shoot_position
	player.play_anim("stand_shoot")
	stage_node.add_child(shot_instance)
	

func update(delta):
	time += delta 
	if time >0.8:
		player.set_state(player.IDLE)

func handle_input():
	if Input.is_action_just_pressed("a"):
		player.set_state(player.JUMPING)
	if Input.is_action_just_pressed("b"):
		if shoots > 0:
			shot_instance = shot_scene.instance()
			stage_node.add_child(shot_instance)
			shot_instance.position = $"../../pivot/spawn_shoot".position
			shoots-=1
	if Input.is_action_pressed("ui_right"):
		player.flip(1)
		player.vel.x = player.run_speed
		player.play_anim("walk_shoot")
	if Input.is_action_pressed("ui_left"):
		player.flip(-1)
		player.vel.x = -player.run_speed
		player.play_anim("walk_shoot")
	if Input.is_action_just_released("ui_right"):
		player.set_state(player.IDLE)
	if Input.is_action_just_released("ui_left"):
		player.set_state(player.IDLE)
		
func exit():
	shoots = 3
	time = 0
	pass
