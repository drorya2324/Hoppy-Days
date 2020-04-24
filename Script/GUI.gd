extends CanvasLayer

func _ready():
	Global.GUI = self


#Being called in GameState(_ready)
func update_GUI(lives,coins):
	$Banner/HBoxContainer/LifeCount.text = str(lives)
	$Banner/HBoxContainer/CoinCount.text= str(coins)


#Being called by GameState
func animate(animation):
	$AnimationPlayer.play(animation)
