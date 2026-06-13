extends Control
var settings_node = preload("res://scenes/settings.tscn")

func _ready() -> void:
	print(FileAccess.get_open_error())
	
	
func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_settings_pressed() -> void:
	var instance = settings_node.instantiate()
	add_child(instance)

func _on_bab_1_pressed() -> void:
	Global.save_prev_scene()
	get_tree().change_scene_to_file("res://scenes/level_select_1.tscn")


func _on_bab_2_pressed() -> void:
	Global.save_prev_scene()
	pass

func _on_bab_3_pressed() -> void:
	Global.load_level = Global.LEVEL_SAYANGI_TANAMAN_LV_1
	Global.save_prev_scene()
	get_tree().change_scene_to_file("res://scenes/loading_screen.tscn")

func _on_bab_4_pressed() -> void:
	Global.save_prev_scene()
	get_tree().change_scene_to_file("res://scenes/level_select_4.tscn")


func _on_button_pressed() -> void:
	pass # Replace with function body.
