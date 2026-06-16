extends Control


var settings_node = preload("res://scenes/settings.tscn")
	
func _on_setting_pressed():
	var instance = settings_node.instantiate()
	add_child(instance)


func _on_quit_pressed():
	get_tree().quit()


func _on_home_pressed():
	get_tree().change_scene_to_file("uid://dmo6htvwp7tj8")


func _on_menu_1_pressed():
	get_tree().change_scene_to_file("uid://d1yhujy7uwn7v")


func _on_menu_2_pressed():
	get_tree().change_scene_to_file("uid://ccxd2gp0dkqwq")
