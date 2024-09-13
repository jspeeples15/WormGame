extends Node

@export var player_manager : Node
@onready var animated_sprite = %sprite

enum PlayerState {
	IDLE,
	UP,
	DOWN,
	LEFT,
	RIGHT,
	UPRIGHT,
	UPLEFT,
	DOWNRIGHT,
	DOWNLEFT
}

var current_state : PlayerState

func _ready():
	set_state(PlayerState.IDLE)

func _process(_delta):
	handle_state()
	handle_sprite()

func set_state(new_state: PlayerState):
	current_state = new_state

func handle_state():
	var direction = player_manager.direction
	
	if(direction.x == 0 && direction.y == 0):
		set_state(PlayerState.IDLE)
	elif(direction.x > 0 && direction.y == 0):
		set_state(PlayerState.RIGHT)
	elif(direction.x < 0 && direction.y == 0):
		set_state(PlayerState.LEFT)
	elif(direction.x == 0 && direction.y > 0):
		set_state(PlayerState.DOWN)
	elif(direction.x == 0 && direction.y < 0 ):
		set_state(PlayerState.UP)
	elif(direction.x > 0 && direction.y > 0):
		set_state(PlayerState.DOWNRIGHT)
	elif(direction.x > 0 && direction.y < 0):
		set_state(PlayerState.UPRIGHT)
	elif(direction.x < 0 && direction.y > 0):
		set_state(PlayerState.DOWNLEFT)
	elif(direction.x < 0 && direction.y < 0 ):
		set_state(PlayerState.UPLEFT)

		
func handle_sprite():
	match current_state:
		PlayerState.IDLE: animated_sprite.play("idle")
		PlayerState.UP: animated_sprite.play("run_up")
		PlayerState.DOWN: animated_sprite.play("run_down")
		PlayerState.LEFT: animated_sprite.play("run_left")
		PlayerState.RIGHT: animated_sprite.play("run_right")
		PlayerState.UPRIGHT: animated_sprite.play("run_upright")
		PlayerState.DOWNRIGHT: animated_sprite.play("run_downright")
		PlayerState.UPLEFT: animated_sprite.play("run_upleft")
		PlayerState.DOWNLEFT: animated_sprite.play("run_downleft")
