extends Node2D
@onready var camera_2d: Camera2D = %Camera2D

func _on_camera_component_left_pressed() -> void:
	pass

func _on_camera_component_left_released() -> void:
	pass

func _on_camera_component_right_pressed() -> void:
	pass

func _on_camera_component_right_released() -> void:
	pass

func _process(delta: float) -> void:
	chara_move(camera_2d.position.x)

func chara_move(of_pos : float):
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector2(of_pos, position.y), 1)
