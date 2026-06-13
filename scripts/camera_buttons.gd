extends Camera2D

@export var camera_speed : float 
@export var bounce_back : bool = true
var moving : bool = false
var movable : bool = true
var moving_direction : String
var moving_up : bool = false
var moving_down : bool = false
var moving_left : bool = false
var moving_right : bool = false
var reset_position : Vector2

func _ready() -> void:
	moving_neutral_check()
	reset_position.y = float(limit_bottom) - (float(limit_bottom) - float(limit_top)) * 0.5 
	reset_position.x = float(limit_right) - (float(limit_right) - float(limit_left)) * 0.5

func _physics_process(delta: float) -> void:
	var x_bounds : bool = global_position.x >= float(limit_left) and global_position.x <= float(limit_right)
	var y_bounds : bool = global_position.y >= float(limit_top) and global_position.y <= float(limit_bottom)
	move_direction()
	if x_bounds == true and y_bounds == true:
	#global_position.x >= float(limit_left) and global_position.x <= float(limit_right) and global_position.y >= float(limit_top) and global_position.y <= float(limit_bottom): 
		movable = true
	else: 
		movable = false

	if movable == true:
		#tween.kill()
		match moving_direction:
			"up":
				global_position.y += -1 * camera_speed 
			"down":
				global_position.y += 1 * camera_speed 
			"left":
				global_position.x += -1 * camera_speed 
			"right":
				global_position.x += 1 * camera_speed 
	
	if movable == false:
		if bounce_back == true:
			if x_bounds == false:
				var tween = create_tween()
				tween.tween_property(self, "position", Vector2(reset_position.x, position.y), 0.1)
			if y_bounds == false:
				var tween = create_tween()
				tween.tween_property(self, "position", Vector2(position.x, reset_position.y), 0.1)
		else: 
			if global_position.x <= float(limit_left):
				var tween = create_tween()
				tween.tween_property(self, "position", Vector2(position.x + 3000, position.y), 0.001)
			if global_position.x >= float(limit_right):
				var tween = create_tween()
				tween.tween_property(self, "position", Vector2(position.x - 3000, position.y), 0.001)
			if global_position.y <= float(limit_top):
				var tween = create_tween()
				tween.tween_property(self, "position", Vector2(position.x, position.y + 3000), 0.001)
			if global_position.y >= float(limit_bottom):
				var tween = create_tween()
				tween.tween_property(self, "position", Vector2(position.x, position.y - 3000), 0.001)
		
func move_direction():
	if moving_up:
		moving_direction = "up"
	if moving_down:
		moving_direction = "down"
	if moving_left:
		moving_direction = "left"
	if moving_right:
		moving_direction = "right"

func _on_camera_component_down_pressed() -> void:
	moving = true
	moving_down = true
func _on_camera_component_down_released() -> void:
	moving_down = false
	await get_tree().create_timer(0.2).timeout
	moving = false
	moving_direction = "null"


func _on_camera_component_left_pressed() -> void:
	moving = true
	moving_left = true
func _on_camera_component_left_released() -> void:
	moving_left = false
	await get_tree().create_timer(0.2).timeout
	moving = false
	moving_direction = "null"


func _on_camera_component_right_pressed() -> void:
	moving = true
	moving_right = true
func _on_camera_component_right_released() -> void:
	moving_right = false
	await get_tree().create_timer(0.2).timeout
	moving = false
	moving_direction = "null"


func _on_camera_component_up_pressed() -> void:
	moving = true
	moving_up = true
func _on_camera_component_up_released() -> void:
	moving_up = false
	await get_tree().create_timer(0.2).timeout
	moving = false
	moving_direction = "null"
	
func moving_neutral_check():
	if moving:
		Global.neutral_state = false
	else:
		Global.neutral_state = true
