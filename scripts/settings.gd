extends Control

signal exit

func _ready() -> void:
	GlobalStopwatch.stopwatch._set_paused(true)
	Global.neutral_state = false

func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)
	
func _on_back_pressed() -> void:
	Global.neutral_state = true
	GlobalStopwatch.stopwatch._set_paused(false)
	emit_signal("exit")

func _on_quit_pressed() -> void:
	Global.neutral_state = true
	get_tree().change_scene_to_file("uid://dmo6htvwp7tj8")
	
func _process(delta: float) -> void:
	if !get_tree().current_scene.name.contains("Control"):
		pass
