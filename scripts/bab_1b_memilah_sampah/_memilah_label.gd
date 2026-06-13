extends Label
@onready var trash_show: Node2D = $"../TrashShow"
@export var label_text : String

func _process(delta: float) -> void:
	var count : int = trash_show.total_count - trash_show.correct_count 
	text = label_text + ": " + str(count)
