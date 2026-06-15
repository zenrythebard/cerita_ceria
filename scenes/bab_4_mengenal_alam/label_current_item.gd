extends Label
@onready var interactible: ExploreControl = %Interactible
@onready var background: NinePatchRect = $"../BackgroundPelafalanObjek"

func _process(delta: float) -> void:
	text = interactible.current_item
	if text == "":
		background.visible = false
	else:
		background.visible = true
