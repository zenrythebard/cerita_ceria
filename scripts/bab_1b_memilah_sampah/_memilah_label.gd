extends Label
@export var trash_show: Node2D  
@export var label_text : String

func _process(delta: float) -> void:
	var count : int = trash_show.total_count - trash_show.correct_count 
	text = str(count)
