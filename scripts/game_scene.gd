extends Node2D

var time : String


func _ready():
	Global.isAtEND = false

	

func _process(delta):
	#set playerNum (Global)
	if Input.is_key_pressed(KEY_1):
		Global.PlayerNum = 1
	if Input.is_key_pressed(KEY_2):
		Global.PlayerNum = 2
	if Input.is_key_pressed(KEY_3):
		Global.PlayerNum = 3

	#speedrun timer
	time = Global.get_time()
	$SpeedRunTimer/Control/Label.text = time
	endGame()

#end game
func endGame():
	if Global.isAtEND:
		get_tree().paused = true
		
		#set visible
		$"start & end points".visible = false
		$SpeedRunTimer.visible = false
		$AT_END.visible = true
		
		#display score
		$"AT_END/SCORE_DISPLAY".text = time
		Global.score = time
		
		setupSilverWolf()


func _on_play_again_pressed():
	get_tree().paused = false
	#set visible
	$"start & end points".visible = true
	$SpeedRunTimer.visible = true
	$AT_END.visible = false
	
	get_tree().reload_current_scene()

func _on_goback_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/mainMenu/main_menu.tscn")
	
func setupSilverWolf():
		#print(Global.player_name)
		#print(Global.score)
		
		
		Global.score = Global.time_string_to_milliseconds(Global.score) #convert to milliseconds
		
		SilentWolf.Scores.save_score(Global.player_name, Global.score)
		
		
		var sw_result: Dictionary = await SilentWolf.Scores.save_score(Global.player_name, Global.score).sw_save_score_complete
		print("Score persisted successfully: " + str(sw_result.score_id))



