extends Control




func _ready() -> void:
	GlobalAudio.bgm_player.stream = GlobalAudio.BGM_GENERAL
	GlobalAudio.bgm_player.play()
	
var settings_node = preload("res://scenes/settings.tscn")
func _on_settings_button_up() -> void:
	var instance = settings_node.instantiate()
	add_child(instance)

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_bab_1_pressed() -> void:
	get_tree().change_scene_to_file("uid://mxd70xkg6sx2")

func _on_bab_2_pressed() -> void:
	get_tree().change_scene_to_file("uid://ct1olmi153yy7")

func _on_bab_3_pressed() -> void:
	get_tree().change_scene_to_file("uid://cum7aqms8nfnc")
