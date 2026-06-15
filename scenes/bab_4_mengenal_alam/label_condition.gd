extends Label

@onready var interactible: Node2D = %Interactible
@export var label_text : String

func _process(delta: float) -> void:
	match interactible.check_condition:
		1: 
			text = "carilah benda " + interactible.condition_type
		2:
			text = "carilah benda alam"
		3:
			text = "carilah benda " + interactible.condition_type + "berarna " + interactible.condition_color
