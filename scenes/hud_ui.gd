extends CanvasLayer
@onready var timer_label: Label = $TimerLabel
@onready var stopwatch: Stopwatch = GlobalStopwatch.stopwatch
@export var counter : Node2D


func _process(delta: float) -> void:
	timer_label.text = stopwatch.get_elapsed_time_as_formatted_string("{MM}:{ss}")
