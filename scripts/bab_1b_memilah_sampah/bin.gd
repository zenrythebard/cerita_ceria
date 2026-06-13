class_name SortBin extends Node2D

@export var sprite : Sprite2D
var type : String
var item : String
signal pressed

func _ready() -> void:
	type = sprite.type
	item = sprite.item

func _on_sprite_neutral_pressed() -> void:
	emit_signal("pressed")
	Global.neutral_state = false
