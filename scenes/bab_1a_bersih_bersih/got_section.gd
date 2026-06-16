extends Node2D
@onready var click_sprite: ClickSprite = $ClickSprite
var cleaned : bool = false
@export var item_counter : ItemCounter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	click_sprite.texture = preload("uid://b7tl0cicdlb6x")

func _on_click_sprite_neutral_pressed() -> void:
	if cleaned:
		return
	cleaned = true
	click_sprite.texture = preload("uid://bwgkmhuuv553x")
	item_counter.item_count += 1
	print(item_counter.item_count)
