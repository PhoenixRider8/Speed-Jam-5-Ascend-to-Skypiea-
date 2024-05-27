extends Area2D

var speed = 200
func _physics_process(delta):
	position.y-= speed * delta #positon goes up
		
	if position.y < 0:
		queue_free()
	
#slash attack
func _on_area_entered(area):
	pass
