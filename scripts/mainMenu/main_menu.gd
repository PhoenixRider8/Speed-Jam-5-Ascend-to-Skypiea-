extends Control
@onready var leaderboard = preload("res://scenes/Scores/Leaderboard.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/leaderBoardScene/player_name.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_leaderboard_pressed():
	#get_tree().change_scene_to_file("res://scenes/leaderBoardScene/leaderboard.tscn")
	get_tree().change_scene_to_packed(leaderboard)
