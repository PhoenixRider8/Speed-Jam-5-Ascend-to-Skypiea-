extends Area2D

#health
@onready var health_bar = $HealthBar
var health = 3

func _ready():
	#set health
	health_bar.init_health(health)
	
	#randomise position in x axis
	randomize()
	position=Vector2(randf_range(100,1061) , 0) #spawn enemy in random position

func _physics_process(delta):
	#update position
	position.y += 50 * delta

func _on_area_entered(area):
	if area.name == "SlashAttack":
		health -=1
		_set_seaKing_health()
		Global.GoingMerrySpeed -= 250

#health check
func _set_seaKing_health():
	health_bar.health = health
	
	if health <=0:
		_die()
		
func _die():
	Global.GoingMerrySpeed +=500
	queue_free()
