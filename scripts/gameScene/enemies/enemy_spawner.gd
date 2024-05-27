extends Node2D

var southBird = preload("res://scenes/gameScene/enemies/south_bird.tscn")
var seaKing = preload("res://scenes/gameScene/enemies/sea_king.tscn")


func _ready():
	#Spawning Enemies
	var timer1 = Timer.new() #create timer for spawning enemies
	var timer2 = Timer.new()
	
	add_child(timer1) #add timer to game manager node
	add_child(timer2)
	
	timer1.wait_time = 10 
	timer2.wait_time = 5
	
	timer1.timeout.connect(create_southBird) #timeout of 1.5 secs everytime create_enemy() function is called 
	timer2.timeout.connect(create_seaKing)
	
	timer1.start() 
	timer2.start()
	
func _physics_process(delta):
	#update position of spawner
	position.y -= 100 * delta
	
#spawn enemies
func create_southBird():
	var bird = southBird.instantiate()
	get_parent().get_node("BirdCollection").add_child(bird)
	
func create_seaKing():
	var king = seaKing.instantiate()
	get_parent().get_node("SeaKingCollection").add_child(king)

