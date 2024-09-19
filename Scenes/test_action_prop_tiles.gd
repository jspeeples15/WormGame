extends TileMapLayer

const ON_FIRE_ATLAS_COORDS = Vector2(23,9)
const BASE_POSITION = Vector2(0,0)
const SOURCE_ID = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func set_on_fire():
	set_cell(BASE_POSITION, SOURCE_ID, ON_FIRE_ATLAS_COORDS)
