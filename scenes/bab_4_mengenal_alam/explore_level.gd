extends Node2D
@onready var current_scene : String = get_tree().current_scene.name

func _on_interactible_level_end() -> void:
	match current_scene:
		"MengenalPantai L1":
			get_tree().change_scene_to_file("uid://y5xb2qi7f5ih")
		"MengenalTaman L1":
			get_tree().change_scene_to_file("uid://by0ehotw7eb1e")

func _ready() -> void:
	match current_scene:
		"MengenalPantai L1":
			GlobalAudio.bgm_player.stream = GlobalAudio.BGM_PANTAI
		"MengenalTaman L1":
			GlobalAudio.bgm_player.stream = GlobalAudio.BGM_TAMAN
	GlobalAudio.bgm_player.play()

	
