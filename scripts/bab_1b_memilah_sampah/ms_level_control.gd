extends Node2D
@onready var sprite: AnimatedSprite2D = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalAudio.bgm_player.stream = GlobalAudio.BGM_MEMILAH_SAMPAH
	GlobalAudio.bgm_player.play()
	Global.neutral_state = true
	sprite.play("tita_idle")

func _on_trash_show_level_complete() -> void:
	var instance = Global.RETURN.instantiate()
	add_child(instance)
	instance.reparent(%CanvasShow)
