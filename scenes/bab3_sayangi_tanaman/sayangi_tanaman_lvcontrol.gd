class_name SayangiTanaman extends Node2D
var current_object : TanamanObject
var current_order : int
@onready var center_point: Sprite2D = $CenterPoint
var engaged : bool = false

const WADAH3 = preload("uid://d0yxv5f4hrga8")
const WADAH2 = preload("uid://cu8c0dvbfoudy")
const WADAH1 = preload("uid://b2cpwwi0ta4xt")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_object = null
	current_order = 1

func _physics_process(delta: float) -> void:
	check_current_object()
	

func check_current_object():
	if current_object == null:
		return
		
	if !current_object.object_order == current_order:
		current_object = null
		return
		
	var tween = get_tree().create_tween().set_ease(Tween.EASE_IN)
	tween.tween_property(current_object, "global_position", center_point.global_position, 1)
	tween.tween_property(self, "current_order", current_order + 1, 0.1)
	tween.tween_property(current_object, "modulate:a", 0, 0.2)
	await tween.finished
	center_check()
	current_object = null
	
	

func center_check():
	match current_order:
		1: center_point.texture = null
		2: center_point.texture = WADAH1
		3: center_point.texture = WADAH2
		4: 
			center_point.texture = WADAH3
			get_tree().change_scene_to_file("res://scenes/bab3_sayangi_tanaman/sayangi_tanaman_lv_2.tscn")
	
