extends CanvasLayer

var player_name

func _on_enter_pressed():
	get_tree().change_scene_to_file("res://scenes/gameScene/game_scene.tscn")
	Global.player_name = $Input/LineEdit.text
	#print(Global.player_name)

