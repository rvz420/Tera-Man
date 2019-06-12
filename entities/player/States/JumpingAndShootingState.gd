extends "res://entities/player/PlayerState.gd"

var shot_scene = preload("res://entities/player/Weapons/normal_shoot.tscn")
var shoots = 2
var time = 0
var stage_node
var shot_instance
var shoot_position

func enter():
	stage_node = get_parent().get_parent().get_parent()
	player.play_anim("jump_shoot")
	create_shoot()

func update(delta):
	time += delta 
	if time >0.8 or shoots == 0:
		player.set_state(player.JUMPING)
		
	if player.is_on_floor():
		player.set_state(player.IDLE)
	
func handle_input():
	if Input.is_action_just_pressed("b"):
		if shoots > 0:
			create_shoot()
			shoots-=1
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

func create_shoot():
	shot_instance = shot_scene.instance()
	shot_instance.position = player.get_shoot_position()
	shot_instance.set_dir(player.dir)
	stage_node.add_child(shot_instance)

func exit():
	shoots = 3
	time = 0
