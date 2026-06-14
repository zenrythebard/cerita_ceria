extends Control

var settings_node = preload("res://scenes/settings.tscn")
func _on_setting_pressed() -> void:
	var instance = settings_node.instantiate()
	add_child(instance)


func _on_close_pressed() -> void:
	get_tree().quit()


func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("uid://dmo6htvwp7tj8")


func _on_menu_1_pressed() -> void:
	get_tree().change_scene_to_file("uid://py17d4venwt5")

func _on_menu_2_pressed() -> void:
	pass # Replace with function body.
