extends Control

var settings_node = preload("res://scenes/settings.tscn")
func _on_setting_pressed() -> void:
	var instance = settings_node.instantiate()
	add_child(instance)

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("uid://mxd70xkg6sx2")

func _on_r_tamu_pressed() -> void:
	Global.load_level = Global.LEVEL_R_TAMU_A_1
	get_tree().change_scene_to_file("res://scenes/loading_screen.tscn")

func _on_dapur_pressed() -> void:
	Global.load_level = Global.LEVEL_DAPUR_1
	get_tree().change_scene_to_file("res://scenes/loading_screen.tscn")

func _on_r_keluarga_pressed() -> void:
	Global.load_level = Global.LEVEL_R_KELUARGA_1
	get_tree().change_scene_to_file("res://scenes/loading_screen.tscn")

func _on_halaman_pressed() -> void:
	Global.load_level = Global.LEVEL_HALAMAN_1
	get_tree().change_scene_to_file("res://scenes/loading_screen.tscn")
