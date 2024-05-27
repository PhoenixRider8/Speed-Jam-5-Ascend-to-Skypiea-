extends Area2D

var slashAttack = preload("res://scenes/gameScene/player/2. Zoro/slash_attack.tscn")
var shipPos

func _ready():
	$ZoroSprite.play("idle")

func _physics_process(delta):
	#update position with respect to ship
	shipPos = get_parent().get_node("GoingMerry").position
	position.y -= 10 * delta
	position.x = shipPos.x - 40
	
	#check for PlayerNum
	if Global.PlayerNum == 2: #zoro selected
		if Input.is_action_just_pressed("leftClick"):
			$ZoroSprite.play("attack")
				

func _on_zoro_sprite_animation_finished():
	if $ZoroSprite.animation == "attack":
		var slash_obj = slashAttack.instantiate()
		slash_obj.position.x = position.x
		slash_obj.position.y = position.y - 64
		get_node("Slashcollection").add_child(slash_obj)
		
		$ZoroSprite.play("idle")
