extends Control

signal next 

func _on_video_stream_player_finished() -> void:
	emit_signal("next")

func _on_skip_pressed() -> void:
	emit_signal("next")

func _on_next() -> void:
	Global.load_level = Global.LEVEL_MENGENAL_PANTAI
	get_tree().change_scene_to_file("res://scenes/loading_screen.tscn")
	
