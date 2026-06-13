extends Node2D

var mouse_position : Vector2

func _on_animation_player_current_animation_changed(name: String) -> void:
	mouse_position = get_global_mouse_position()
	position = mouse_position
