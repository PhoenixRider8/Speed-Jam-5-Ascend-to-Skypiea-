extends Node

#LEADERBOARD

#save file
var playerScoreList = {}

#setup leaderboard
var player_name #player name
var score = 0

func _ready():
	SilentWolf.configure({
		"api_key": "dZrP5FDGdj9tqs8cecyMI9GlMQkKXrPA17MXUVat",
		"game_id": "skypeialeaderboard",
		"log_level": 0
  })
	SilentWolf.configure_scores({
	"open_scene_on_close": "res://scenes/mainMenu/main_menu.tscn"
  })

#----------------------------------------------------------------------------------------
#GAME SCENE

#timer
@onready var game_start_timer = Time.get_ticks_msec()

var PlayerNum : int = 2 #1-> Luffy , 2-> Zoro, 3-> Usopp

#ship
var GoingMerrySpeed = 300

var UsoppBulletPos #usopp attack position

#get timer data
func get_time():
	var current_time = Time.get_ticks_msec() - game_start_timer
	var minutes = current_time/1000/60
	var seconds = current_time/1000%60
	var msec = current_time%1000/10
	
	#handle single digits in timer
	if minutes<10:
		minutes = "0"+str(minutes)
			
	if seconds<10:
		seconds = "0"+str(seconds)
		
	if msec<10:
		if msec == 0:
			msec = "00"
		else:
			msec = "0"+str(msec)
	
	return (str(minutes)+" : "+str(seconds)+" : "+str(msec))

#start and end points
var isAtEND = false
var GoingMerryPos 

#convertion
# Convert time string (e.g., "00:01:23") to total milliseconds
func time_string_to_milliseconds(time_str):
	var parts = time_str.split(":")
	var minutes = int(parts[0])
	var seconds = int(parts[1])
	var millis = int(parts[2])
	return (minutes * 60 * 1000) + (seconds * 1000) + millis

# Convert total milliseconds to time string (e.g., "00:01:23")
func milliseconds_to_time_string(milliseconds):
	var minutes = milliseconds / 60000
	var remaining = milliseconds % 60000
	var seconds = remaining / 1000
	var millis = remaining % 1000
	return str(minutes).pad_zeros(2) + ":" + str(seconds).pad_zeros(2) + ":" + str(millis).pad_zeros(3)
