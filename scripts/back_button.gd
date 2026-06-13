extends Button

func _on_pressed() -> void:
	if Global.previous_scene_path == "":
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
		return
	get_tree().change_scene_to_file(Global.previous_scene_path)
