class_name AntLevel extends Node2D
var belalang = preload("uid://l600p51wwt3e")
@onready var right_mark: Marker2D = $RightMark
@onready var left_mark: Marker2D = $LeftMark
@onready var timer: Timer = $Timer
var rng = RandomNumberGenerator.new()
@export var short_time : float
@export var long_time : float
@export var max_health : float
var health : float
var take_damage : bool 
@onready var health_bar: ProgressBar = $HealthBar
@onready var game_timer: Timer = $GameTimer

func _ready() -> void:
	health = max_health
	timer.start()
	game_timer.start()
	health_bar.max_value = health

func _physics_process(delta: float) -> void:
	health_bar.value = health
	if take_damage:
		health -= 0.5
		

func _on_timer_timeout() -> void:
	var instance = belalang.instantiate()
	var check : int = rng.randi_range(0, 1)
	match check:
		0:
			instance.position = right_mark.position
			instance.direction = -1
			instance.sprite.flip_h = false
		1:
			instance.position = left_mark.position
			instance.direction = 1
			instance.sprite.flip_h = true
	add_child(instance)
	timer.start(randf_range(short_time, long_time))

func _on_area_2d_body_entered(body: Belalang) -> void:
	take_damage = true

func _on_area_2d_body_exited(body: Belalang) -> void:
	take_damage = false
