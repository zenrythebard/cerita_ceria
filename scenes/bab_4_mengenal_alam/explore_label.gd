extends Label

@onready var interactible: Node2D = %Interactible
@export var label_text : String

func _process(delta: float) -> void:
	var count : int = interactible.correct_target - interactible.correct_count
	if interactible.check_condition != 3:
		text = label_text + ": " + str(count)
	if interactible.check_condition == 3:
		count = 1 - interactible.correct_count
		text = label_text + ": " + str(count)
