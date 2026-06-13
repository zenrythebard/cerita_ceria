class_name Belalang extends CharacterBody2D

@export var sprite : ClickSprite 
const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var jump : bool = false
@export var direction : int
@export var speed_mod : float
@export var jump_mod : float
@export var collision_shape: CollisionShape2D  

func _ready() -> void:
	collision_shape.disabled = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if jump and is_on_floor():
		velocity.y = JUMP_VELOCITY * jump_mod
		velocity.x = direction * SPEED * speed_mod
		jump = false
	elif is_on_floor():
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_timer_timeout() -> void:
	jump = true

func _on_belalang_button_pressed() -> void:
	velocity.y = JUMP_VELOCITY * jump_mod
	collision_shape.disabled = true
	await get_tree().create_timer(3).timeout
	queue_free()
