class_name TanamanObject extends Node2D
@export var object_name : String
@export var object_order : int
@export var level_controler : SayangiTanaman 

func _on_click_sprite_neutral_pressed() -> void:
	level_controler.current_object = self
