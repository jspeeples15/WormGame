extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_interacting(interaction_choice: String, effects: Array[String]) -> void:
	print(interaction_choice)
	print(effects)
	if (interaction_choice == name && effects.has("enflame")):
		$TestActionPropTiles.set_on_fire()
