extends Node2D
@onready var current_scene : String = get_tree().current_scene.name

func _on_interactible_level_end() -> void:
	var instance = Global.RETURN.instantiate()
	add_child(instance)
	$Return.reparent(%CanvasShow)

func _ready() -> void:
	match current_scene:
		"MengenalPantai L1":
			GlobalAudio.bgm_player.stream = GlobalAudio.BGM_PANTAI
		"MengenalTaman L1":
			GlobalAudio.bgm_player.stream = GlobalAudio.BGM_TAMAN
	GlobalAudio.bgm_player.play()
	
