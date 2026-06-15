extends Control

signal next

func _on_skip_pressed() -> void:
	emit_signal("next")

func _on_video_stream_player_finished() -> void:
	emit_signal("next")

func _on_next() -> void:
	get_tree().change_scene_to_file("uid://cum7aqms8nfnc")
