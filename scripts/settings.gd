extends Control

func _ready() -> void:
	GlobalStopwatch.stopwatch._set_paused(true)

func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)
	
func _on_back_pressed() -> void:
	GlobalStopwatch.stopwatch._set_paused(false)
	queue_free()

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	
func _process(delta: float) -> void:
	if !get_tree().current_scene.name.contains("Control"):
		pass
