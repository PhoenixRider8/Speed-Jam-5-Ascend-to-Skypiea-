extends Area2D

var bulletAttack = preload("res://scenes/gameScene/player/3. Usopp/bullet.tscn")
var mouse_pos
var shipPos

func _ready():
	$UsoppSprite.play("idle")
	
func _physics_process(delta):
	#update position with respect to ship
	shipPos = get_parent().get_node("GoingMerry").position
	position.y -= 10 * delta
	position.x = shipPos.x + 40
	
	#check for PlayerNum
	if Global.PlayerNum == 3: #usopp selected
		if Input.is_action_just_pressed("leftClick"):
			
			#update mouse position
			mouse_pos = get_viewport().get_mouse_position()
			Global.UsoppBulletPos = mouse_pos
			
			
			#check mouse_pos with goingmerry
			if shipPos.x >= mouse_pos.x :
				$UsoppSprite.flip_h = false
			if mouse_pos.x < shipPos.x:
				$UsoppSprite.flip_h = true
			
			$UsoppSprite.play("attack")


func _on_usopp_sprite_animation_finished():
	
	if $UsoppSprite.animation == "attack":
		var bullet_obj = bulletAttack.instantiate()
		bullet_obj.position.x = position.x
		bullet_obj.position.y = position.y - 64
		get_node("Bulletcollection").add_child(bullet_obj)
		$UsoppSprite.flip_h = false
		$UsoppSprite.play("idle")




