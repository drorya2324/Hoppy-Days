extends KinematicBody2D

const SPEED = 750
const JUMP_SPEED= -1500
const GRAVITY = 3600
const UP=Vector2(0,-1)
const JUMP_BOOST = 1.7*JUMP_SPEED



var motion = Vector2()
var has_double_jumped = false
var flinch = false
var boosted

export var world_limit= 3000
export var Double_Jump = false


func _ready():
	Global.Player = self



func _physics_process(delta):
	fall(delta)
	run()
	jump()
	move_and_slide(motion, UP)


func _process(delta):
	update_animation()


func update_animation():
	Global.PlayerAnimations.updating(motion)


func jump():
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor() == true:
			has_double_jumped = false
			motion.y =  JUMP_SPEED
			Global.Jump_SFX.play()
		elif has_double_jumped == false:
			motion.y =  JUMP_SPEED/1.3
			Global.Jump_SFX.play()
			has_double_jumped = true


func run():
	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right") :
		motion.x =  -SPEED
	elif Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left") :
		motion.x = SPEED
	else:	
		motion.x =  0
		




#Being called by GameState
func hurt():
	$AnimatedSprite/Timer.start()
	flinch = true
	Global.Pain_SFX.play()
	motion.y = JUMP_SPEED

	
#func when timer ends:
	#hurt = false
func _on_Timer_timeout():
	flinch = false
	boosted = false


func fall(delta):	
	#limiting the fall speed and allowing bunny
	# to boost properly on the JumpPads:
	motion.y = clamp(motion.y, (JUMP_BOOST), -JUMP_SPEED)
	
	if is_on_floor() and not flinch and not boosted:
		motion.y=0
	elif is_on_ceiling() :
		motion.y=+ 1
	else:
		motion.y += GRAVITY * delta
	if position.y > world_limit:
		Global.GameState.end_game()



#Being called by JumpPad
func boost():
	$AnimatedSprite/Timer.start()
	boosted= true
	motion.y = JUMP_BOOST 

