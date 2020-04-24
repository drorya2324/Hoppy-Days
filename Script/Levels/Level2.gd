extends Node2D

export var starting_lives = 3
export var coin_target = 5
var lives
var coins =0
var animation

onready var GUI=Global.GUI

func _ready():
	Global.GameState = self
	lives=starting_lives
	update_GUI()
	
func update_GUI():
	GUI.update_GUI(lives,coins)


#Being called by Hazards, SpikesBottom, Lightning
func hurt():
	lives -= 1
	update_GUI()
	animate_GUI("LifeLoss")
	Global.Player.hurt()
	if lives < 0:
		end_game()

func animate_GUI(animation):
	GUI.animate(animation)


#Being called by Coin
func coin_up():
	coins+=1
	update_GUI()
	Global.Coin_SFX.play()
	animate_GUI("CoinPulse")
	if coins== coin_target:
		lives +=1
		coins=0
		update_GUI()
		Global.LifeUp_SFX.play()
		animate_GUI("LifePulse")
	
	

#Being called by Player(fall), GameState(hurt)
func end_game():
	get_tree().change_scene(Global.GameOver)
	

#Next Level!
func _on_Portal_body_entered(body):
	get_tree().change_scene(Global.Victory)
