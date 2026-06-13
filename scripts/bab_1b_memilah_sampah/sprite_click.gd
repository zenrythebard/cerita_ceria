class_name ClickSprite extends Sprite2D
@export var type: String = ""
@export var item: String = ""
var pressed : bool = false
var disabled : bool = false
signal button_pressed
signal neutral_pressed

func _input(event) -> void:
	var event_pos
	if event is not InputEventKey:
		event_pos = make_input_local(event).position
	await get_tree().create_timer(0.1).timeout
	if event is InputEventScreenTouch and is_pixel_opaque(event_pos) and disabled == false:
		emit_signal("button_pressed")
		GlobalAudio.sfx_player.stream = GlobalAudio.SFX_POP
		GlobalAudio.sfx_player.play()
		if get_tree().current_scene.name != "Memilah L1":
			if Global.neutral_state == true:
				emit_signal("neutral_pressed")
		elif Global.neutral_state == true:
			emit_signal("neutral_pressed")
