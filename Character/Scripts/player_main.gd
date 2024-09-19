extends CharacterBody2D

@export var player_speed : int = 200

var veloctiy : Vector2
var direction : Vector2
var is_interacting: bool
var words: Array[Word] = []


signal interacting

func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	var enflame_scene = load("res://Words/scenes/Burn.tscn")
	var enflame_verb = enflame_scene.instantiate()
	words.append(enflame_verb)
	print(words)

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

func _process(_delta):
	if not is_interacting and Input.is_action_just_pressed("interact"):
		interact()
		
func _on_dialogic_signal(msg: String):
	if msg == "done":
		is_interacting = false
	elif msg == "wish_for_big":
		print("making big!")
		player_speed *= 2
		scale *= 2

func interact():
	is_interacting = true
	
	var overlapping_bodies = $InteractionArea.get_overlapping_bodies()
	var nearest_distance: float = $InteractionArea/InteractionRadius.shape.radius
	var nearest_distance_squared = nearest_distance * nearest_distance
	var interaction_choice = self
	var min_length_away = nearest_distance_squared + 1
	for overlapping_body in overlapping_bodies:
		var body_distance_squared = self.global_position.distance_squared_to(overlapping_body.global_position)
		if body_distance_squared < min_length_away:
			interaction_choice = overlapping_body
			min_length_away = body_distance_squared
	
	interacting.emit(interaction_choice.name, words[0].effects)


func _on_interacting(interaction_choice: String) -> void:
	if interaction_choice == self.name:
		Dialogic.start("idle_self")
