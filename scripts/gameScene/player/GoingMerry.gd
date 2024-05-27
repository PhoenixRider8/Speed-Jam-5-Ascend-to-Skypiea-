extends CharacterBody2D


var SPEED = 300.0
const up_speed = 10

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	SPEED = Global.GoingMerrySpeed
	#movement
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	position.y -= 10 * delta
	
	move_and_slide()
