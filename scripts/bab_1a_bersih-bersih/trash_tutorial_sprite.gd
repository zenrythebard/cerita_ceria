extends Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var item_counter : ItemCounter
var tutorial_state : String

func _ready() -> void:
	visible = false
	tutorial_state = "click"
	
func _physics_process(delta: float) -> void:
	if Global.neutral_state == true:
		visible = true
		match tutorial_state:
			"click":
				animation_player.play("click_tutorial")
			"drag":
				queue_free()
	else:
		visible = false
		
	if item_counter.item_count == 1:
		tutorial_state = "drag"
