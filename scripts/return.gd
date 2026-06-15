extends Control

func _ready() -> void:
	GlobalAudio.sfx_player.stream = GlobalAudio.SFX_WIN_2
	GlobalAudio.sfx_player.play()

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("uid://dmo6htvwp7tj8")
