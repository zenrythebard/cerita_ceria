extends Sprite2D

func _ready() -> void:
	visible = false

func show_dialogue():
		visible = true
		$DialogueTimer.start(3)
		
func _on_dialogue_timer_timeout() -> void:
	visible = false

func _on_bottle_trash_pressed() -> void:
	show_dialogue()
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/trash_lv1.dialogue"), "bottle")

func _on_milk_trash_pressed() -> void:
	show_dialogue()
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/trash_lv1.dialogue"), "milk")

func _on_drink_trash_pressed() -> void:
	show_dialogue()
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/trash_lv1.dialogue"), "drink")
