extends Area2D

func _ready():
	Global.JumpPad = self

func _on_JumpPad_body_entered(body):
	$AnimatedSprite.play("spring")
	$Timer.start()
	Global.JumpPad_SFX.play()
	Global.Player.boost()
	Global.Player.has_double_jumped = false

func _on_Timer_timeout():
	$AnimatedSprite.play("idle")
	
