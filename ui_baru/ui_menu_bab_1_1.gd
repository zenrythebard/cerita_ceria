extends Control

var settings_node = preload("res://scenes/settings.tscn")
func _on_setting_pressed() -> void:
	var instance = settings_node.instantiate()
	add_child(instance)

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("uid://mxd70xkg6sx2")
