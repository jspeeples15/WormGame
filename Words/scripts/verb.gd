extends Word

class_name Verb

@export var effects: Array[String] = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	prep_color()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func invoke() -> void:
	for effect in effects:
		print(effect)
