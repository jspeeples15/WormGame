extends Control

class_name Word

@export var label: String
@export var color: Color

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	prep_color()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func prep_color() -> void:
	$Label.set("theme_override_colors/default_color", color)
