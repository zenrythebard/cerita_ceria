extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	
func _on_item_counter_show_image() -> void:
	visible = true
