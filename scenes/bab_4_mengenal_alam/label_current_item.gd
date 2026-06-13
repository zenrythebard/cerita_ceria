extends Label
@onready var interactible: ExploreControl = %Interactible

func _process(delta: float) -> void:
	text = interactible.current_item
