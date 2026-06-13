extends Node2D

@export var completeCount: int 
@export var timer: Timer
var itemCount: int = 0

func _process(_delta: float) -> void:
	if itemCount == completeCount:
		print("success")
		pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("tap"):
		raise_count()

func raise_count():
	if Global.object_type == "trash":
		itemCount += 1
		print(itemCount)
		Global.object_type = ""
		print(Global.neutral_state)
		timer.start(2)
		pass
	else:
		timer.start(1)
		print(Global.neutral_state)
		
func _on_timer_timeout():
	Global.neutral_state = true
	print(Global.neutral_state)
	 
