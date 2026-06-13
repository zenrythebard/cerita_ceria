class_name CameraComp extends Node
@export var camera_2d: Camera2D
@export var disable_h : bool = false
@export var disable_v : bool = false

signal right_pressed
signal right_released
signal up_pressed
signal up_released
signal left_pressed
signal left_released
signal down_pressed
signal down_released




func _on_up_button_pressed() -> void:
	emit_signal("up_pressed")
func _on_up_button_released() -> void:
	emit_signal("up_released")

func _on_down_button_pressed() -> void:
	emit_signal("down_pressed")
func _on_down_button_released() -> void:
	emit_signal("down_released")

func _on_right_button_pressed() -> void:
	emit_signal("right_pressed")
func _on_right_button_released() -> void:
	emit_signal("right_released")

func _on_left_button_pressed() -> void:
	emit_signal("left_pressed")
func _on_left_button_released() -> void:
	emit_signal("left_released")
