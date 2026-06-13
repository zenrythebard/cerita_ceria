extends Button
var settings_node = preload("res://scenes/settings.tscn")
@onready var hud_ui: CanvasLayer = $".."

func _on_pressed() -> void:
	var instance = settings_node.instantiate()
	hud_ui.add_child(instance)
