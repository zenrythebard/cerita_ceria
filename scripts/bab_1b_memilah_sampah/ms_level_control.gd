extends Node2D
@onready var sprite: AnimatedSprite2D = $Sprite
@onready var papan: Sprite2D = $PapanPetunjuk1024x1024

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalStopwatch.stopwatch.reset()
	GlobalAudio.bgm_player.stream = GlobalAudio.BGM_MEMILAH_SAMPAH
	GlobalAudio.bgm_player.play()
	Global.neutral_state = true
	sprite.play("tita_idle")

func _on_trash_show_level_complete() -> void:
	get_tree().change_scene_to_file("uid://b1eagi58vsww1")


func _on_clue_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		papan.visible = true
		GlobalStopwatch.stopwatch._set_paused(true)
	else:
		papan.visible = false
		GlobalStopwatch.stopwatch._set_paused(false)
		
