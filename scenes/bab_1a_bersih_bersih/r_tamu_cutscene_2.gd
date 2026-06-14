extends Control
@onready var canvas_layer: CanvasLayer = $CanvasLayer

func _ready() -> void:
	canvas_layer.visible = false

func _on_video_stream_player_finished() -> void:
	canvas_layer.visible = true
