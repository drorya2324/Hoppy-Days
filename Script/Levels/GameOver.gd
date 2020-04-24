extends Control


func _on_TryAgainButton_pressed():
	reload()

#reload Level1 scene:
func reload():
	get_tree().change_scene("res://Scenes/Levels/Level1.tscn")


func _on_ExitGameBotton_pressed():
	get_tree().quit()
