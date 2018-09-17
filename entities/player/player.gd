extends KinematicBody2D

#Export variables
export var run_speed = 82.5 #pixels per second
export var jump_speed = 300 #pixels per second
export var gravity = 15
export var max_vspeed = 7
export var step_speed = 1/7

#Member vars
var vel = Vector2()
var init_step = true
var curr_state

#States 
enum state {IDLE, RUNNING, JUMPING}
onready var idle_state = $states/idle
onready var running_state = $states/running
onready var jumping_state = $states/jumping

func _ready():
	set_state(state.IDLE)
	
 
func _process(delta):
	print(curr_state.name, vel)
	vel.y += gravity 
	curr_state.handle_input()
	curr_state.update(delta)
	vel = move_and_slide(vel,Vector2(0,-1))

	
func play_anim(var anim):
	if $anim.is_playing() && $anim.get_current_animation() == anim:
			pass # do nothing, it's already playing
	else:
		$anim.play(anim)
	
func set_state(new_state):
	if curr_state:
		curr_state.exit()
	match new_state:
		state.IDLE:
			curr_state = idle_state
		state.RUNNING:
			curr_state = running_state
		state.JUMPING:
			curr_state = jumping_state
	curr_state.init(self)