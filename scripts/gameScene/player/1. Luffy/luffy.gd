extends Area2D

var shipPos

func _ready():
	$LuffySprite.play("idle")
	$CollisionShape2D.disabled = true
	
	shipPos = get_parent().get_node("GoingMerry").position
	position.y = shipPos.y - 150
	
func _physics_process(delta):
	#update position with respect to ship
	shipPos = get_parent().get_node("GoingMerry").position
	position.y -= 10 * delta
	
	position.x = shipPos.x +3
	
	if Global.PlayerNum == 1: #luffy selected
		if Input.is_action_just_pressed("leftClick"):
			$LuffySprite.play("attack")

func _on_area_entered(area):
	pass


func _on_luffy_sprite_animation_finished():
	if $LuffySprite.animation == "attack":
		$CollisionShape2D.disabled = false
		$LuffySprite.play("idle")
