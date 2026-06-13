extends Control



func _on_mengenal_alam_pressed() -> void:
	Global.save_prev_scene()
	Global.load_level = Global.LEVEL_MENGENAL_PANTAI
	get_tree().change_scene_to_file("res://scenes/loading_screen.tscn")

func _on_bersih_pressed() -> void:
	Global.save_prev_scene()
	get_tree().change_scene_to_file("res://scenes/level_select_1wip.tscn")
	
func _on_memilah_pressed() -> void:
	Global.save_prev_scene()
	Global.load_level = Global.LEVEL_MEMILAH_1
	get_tree().change_scene_to_file("res://scenes/loading_screen.tscn")
	
func _on_mendaur_pressed() -> void:
	pass
	#Global.save_prev_scene()
	

func _on_indoor_pressed() -> void:
	Global.save_prev_scene()
	Global.load_level = Global.LEVEL_R_TAMU_A_1
	get_tree().change_scene_to_file("res://scenes/bab_1a_bersih_bersih/r_tamu_cutscene_1.tscn")

func _on_outdoor_pressed() -> void:
	Global.save_prev_scene()
	Global.load_level = Global.LEVEL_HALAMAN_1
	get_tree().change_scene_to_file("res://scenes/loading_screen.tscn")

func _on_pantai_pressed() -> void:
	Global.save_prev_scene()
	Global.load_level = Global.LEVEL_MENGENAL_PANTAI
	get_tree().change_scene_to_file("res://scenes/loading_screen.tscn")

func _on_taman_pressed() -> void:
	Global.save_prev_scene()
	Global.load_level = Global.LEVEL_MENGENAL_TAMAN
	get_tree().change_scene_to_file("res://scenes/loading_screen.tscn")

func _on_dapur_pressed() -> void:
	Global.save_prev_scene()
	Global.load_level = Global.LEVEL_DAPUR_1
	get_tree().change_scene_to_file("res://scenes/loading_screen.tscn")

func _on_r_keluarga_pressed() -> void:
	Global.save_prev_scene()
	Global.load_level = Global.LEVEL_R_KELUARGA_1
	get_tree().change_scene_to_file("res://scenes/loading_screen.tscn")
