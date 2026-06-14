extends Control
@onready var canvas_layer: CanvasLayer = $CanvasLayer

func _ready() -> void:
	canvas_layer.visible = false

func _on_video_stream_player_finished() -> void:
	canvas_layer.visible = true


func _on_skip_pressed() -> void:
	get_tree().change_scene_to_file("uid://dmo6htvwp7tj8") 
