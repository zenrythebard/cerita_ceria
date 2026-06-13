extends Label

@onready var interactible: Node2D = %Interactible
@export var label_text : String

func _process(delta: float) -> void:
	match interactible.check_condition:
		1: 
			text = "Benda: " + interactible.condition_type
		2:
			text = "Benda: Alam"
		3:
			text = "Benda: " + interactible.condition_type + ", Warna: " + interactible.condition_color
