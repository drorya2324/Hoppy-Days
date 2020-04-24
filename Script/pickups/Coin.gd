extends AnimatedSprite

var taken= false #prevents multi-coins-collecting

func _on_Area2D_body_entered(body):
	if not taken:
		taken = true
		Global.GameState.coin_up()
		$AnimationPlayer.play("die")
		Global.Coin_SFX.play()
		die()

#Being called in
func die():
	queue_free()
