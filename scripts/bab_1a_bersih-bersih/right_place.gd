extends Node2D

@export var level_type: String = ""
var complete_count: int 
var item_count: int = 0

func _ready() -> void:
	complete_count = get_child_count()

func _process(delta: float) -> void:
	if item_count == complete_count and Global.neutral_state == true:
		pass
		#if get_tree().current_scene.name == "R Tamu L1":
			#get_tree().change_scene_to_file("res://scenes/level_2_ruangtamu.tscn")
			
