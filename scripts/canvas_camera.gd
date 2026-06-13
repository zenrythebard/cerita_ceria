extends CanvasLayer
@onready var up: Sprite2D =  $Node2D/UpSprite
@onready var down: Sprite2D = $Node2D/DownSprite
@onready var right: Sprite2D =  $Node2D/RightSprite
@onready var left: Sprite2D =  $Node2D/LeftSprite
@onready var camera_component: CameraComp = $".."

func _ready() -> void:
	DialogueManager.dialogue_started.connect(_on_dialogue_started)
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)
	if camera_component.disable_h:
		right.queue_free()
		left.queue_free()
	if camera_component.disable_v:
		up.queue_free()
		down.queue_free()
		
func _on_dialogue_started(resource: DialogueResource):
	visible = false
	
func _on_dialogue_ended(resource: DialogueResource):
	visible = true
