extends CharacterBody2D

@export var player_speed : int = 200

var veloctiy : Vector2
var direction : Vector2


func _physics_process(delta):
	direction = Vector2.ZERO
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	
	#movement basics
	if direction:
		direction = direction.normalized()
		velocity = direction * player_speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, player_speed)
		
	move_and_slide()
