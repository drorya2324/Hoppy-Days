extends Node

#Nodes - set automatially
var GameState
var Player
var GUI
var PlayerAnimations
var JumpPad
var Jump_SFX
var Coin_SFX
var Pain_SFX
var LifeUp_SFX
var JumpPad_SFX


#Scene locations - MUST be set MANUALLY
var Level1 = "res://Scenes/Levels/Level1.tscn"
var Level2 = "res://Scenes/Levels/Level2.tscn"
var Victory= "res://Scenes/Levels/Victory.tscn"
var GameOver = "res://Scenes/Levels/GameOver.tscn"
var Lightning = preload("res://Scenes/enemies/Lightning.tscn")
