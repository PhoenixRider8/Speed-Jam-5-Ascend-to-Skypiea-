extends Area2D

var speed = 300
var mouse_pos
#var direction 

func _ready():
	mouse_pos = Global.UsoppBulletPos
	#direction = global_position.direction_to(mouse_pos.global_position)

func _physics_process(delta):
	if mouse_pos !=position:
		position.y-= speed * delta #positon goes up
		if mouse_pos.x > position.x :
			position.x += speed * delta
		else:
			position.x -= speed * delta
	
	if position.y < 0:
		queue_free()
		
func _on_area_entered(area):
	pass
