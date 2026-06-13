extends HSlider
var master_volume : float

func _ready() -> void:
	master_volume = AudioServer.get_bus_volume_db(0)
	value = master_volume

func _on_mouse_exited() -> void:
	self.release_focus()
	
func _on_value_changed(value: float) -> void:
	master_volume = AudioServer.get_bus_volume_db(0)
	value = master_volume
