extends Node2D
@onready var sprite: AnimatedSprite2D = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.current_dialogue_balloon(true, Global.SOLO_BALLOON)
	Global.neutral_state = true

func _on_trash_show_level_complete() -> void:
	var instance = Global.RETURN.instantiate()
	add_child(instance)
	$Return.reparent(%CanvasShow)

func _physics_process(delta: float) -> void:
	sprite.play("tita_idle")
