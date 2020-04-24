extends AnimatedSprite

func _ready():
	Global.PlayerAnimations = self
	
#Being called by Player (update_motion)
func updating(motion):
	if  motion.x>0:
		set_flip_h(false)
		play("run")
	elif motion.x < 0:
		set_flip_h(true)
		play("run")
	else:
		if motion.y==0:
			play("idle")
		else:
			play("jump")
	if Input.is_action_just_pressed("ui_up"):
		play("jump")
	if Global.Player.flinch == true:
		play("hurt")
