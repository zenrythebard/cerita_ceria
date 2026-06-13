extends Label

@export var item_counter : ItemCounter
@export var label_text : String

func _process(delta: float) -> void:
	var count := item_counter.complete_count - item_counter.item_count
	text = label_text + ": " + str(count)
