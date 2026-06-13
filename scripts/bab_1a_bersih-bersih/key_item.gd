extends Node2D

@onready var sprite : Clickable = $Sprite
@onready var anim_player : AnimationPlayer = $AnimationPlayer
@onready var timer : Timer = $Timer
@export var destroy: bool = false
@export var type : String
@export var item : String

func _ready() -> void:
	sprite.type = type
	sprite.item = item
	check_found()
	print(Global.key_item_found)
	
func _process(_delta: float) -> void:
	if destroy:
		Global.key_item_found = true
		Global.neutral_state = true
		queue_free()

func check_found():
	if Global.key_item_found == true:
		queue_free()
	else:
		pass

func _on_sprite_key_item_pressed() -> void:
	reparent(%CanvasShow)
	Global.key_item_found = true
	anim_player.play("showcase_key")
	anim_player.seek(0)
	

	
