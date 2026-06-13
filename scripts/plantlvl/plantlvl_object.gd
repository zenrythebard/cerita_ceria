extends Node2D

@export var sprite : Sprite2D
@export var type : String
@export var enter_area : Area2D
var of : Vector2 = Vector2.ZERO
var dragging : bool = false

func _input(event: InputEvent) -> void:
		if dragging == true:
			print(dragging)
			position = get_global_mouse_position() - of

func _on_touch_screen_button_pressed() -> void:
	dragging = true
	of = get_global_mouse_position() - global_position

func _on_touch_screen_button_released() -> void:
	dragging = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area == enter_area:
		print("area entered")
