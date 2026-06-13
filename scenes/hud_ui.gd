extends CanvasLayer
@onready var label: Label = $Label
@onready var stopwatch: Stopwatch = GlobalStopwatch.stopwatch

func _process(delta: float) -> void:
	label.text = stopwatch.get_elapsed_time_as_formatted_string("{MM}:{ss}")
