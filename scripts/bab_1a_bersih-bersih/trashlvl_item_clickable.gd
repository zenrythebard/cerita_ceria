class_name Clickable extends Sprite2D

@export var type: String = ""
@export var item: String = ""
@onready var camera_2d: Camera2D = %Camera2D

var pressed : bool = false
var disabled : bool = false
signal button_pressed
signal neutral_pressed
signal trash_pressed
signal other_pressed
signal key_item_pressed
signal placable_pressed
signal moveable_pressed
signal place_here_pressed
signal dirt_pressed

const LEVEL_1_RUANGTAMU = preload("uid://bnypttcr3ehw1")
const LEVEL_2_RUANGTAMU = preload("uid://byic4evgruyd3")
const LEVEL_3_RUANGTAMU = preload("uid://bvsik370322v8")
const LEVEL_1_HALAMANRUMAH = preload("uid://ds6spugweadrc")
const LEVEL_2_HALAMANRUMAH = preload("uid://grhei24kpgii")

func _input(event) -> void:
	var event_pos
	if event is not InputEventKey:
		event_pos = make_input_local(event).position
	await get_tree().create_timer(0.1).timeout
	if event is InputEventScreenTouch and is_pixel_opaque(event_pos) and disabled == false and camera_2d.moving == false:
		emit_signal("button_pressed")
		if Global.neutral_state == true:
			emit_signal("neutral_pressed")
			match type:
				"trash":
					GlobalAudio.sfx_player.stream = GlobalAudio.SFX_POP
					GlobalAudio.sfx_player.play()
					emit_signal("trash_pressed")
					Global.neutral_state = false
				"interact":
					GlobalAudio.sfx_player.stream = GlobalAudio.SFX_WRONG_1
					GlobalAudio.sfx_player.play()
					emit_signal("other_pressed")
					Global.neutral_state = false
				"key":
					GlobalAudio.sfx_player.stream = GlobalAudio.SFX_POP
					GlobalAudio.sfx_player.play()
					emit_signal("key_item_pressed")
					Global.neutral_state = false
				"place":
					if !Global.engaged_items.has(item):
						GlobalAudio.sfx_player.stream = GlobalAudio.SFX_POP
						GlobalAudio.sfx_player.play()
						emit_signal("placable_pressed")
						Global.neutral_state = false
						print("placable")
				"move":
					GlobalAudio.sfx_player.stream = GlobalAudio.SFX_POP
					GlobalAudio.sfx_player.play()
					emit_signal("moveable_pressed")
					Global.neutral_state = false
				"place_here":
					if Global.engaged_items.has(item):
						GlobalAudio.sfx_player.stream = GlobalAudio.SFX_POP
						GlobalAudio.sfx_player.play()
						emit_signal("place_here_pressed")
						Global.neutral_state = false
				"dirt":
					GlobalAudio.sfx_player.stream = GlobalAudio.SFX_POP
					GlobalAudio.sfx_player.play()
					emit_signal("dirt_pressed")
					Global.neutral_state = false
			dialogue_show()

func dialogue_show():
	if type != "place":
		get_dialogue()
	if type == "place" and !Global.engaged_items.has(item):
		get_dialogue()

func get_dialogue():
	match get_tree().current_scene.name:
		"R Tamu L1":
			DialogueManager.show_dialogue_balloon_scene(Global.NAME_BALLOON,LEVEL_1_RUANGTAMU, item)
	
		"R Tamu L2":
			if type != "place_here" and type != "button":
				DialogueManager.show_dialogue_balloon_scene(Global.NAME_BALLOON,LEVEL_2_RUANGTAMU, item)
	
		"R Tamu L3":
			if type != "dirt" and type != "button":
					DialogueManager.show_dialogue_balloon_scene(Global.NAME_BALLOON,LEVEL_3_RUANGTAMU, item)
		
		"Dapur L1":
			DialogueManager.show_dialogue_balloon_scene(Global.NAME_BALLOON,LEVEL_1_RUANGTAMU, item)
	
		"Dapur L2":
			if type != "place_here" or type != "button":
				DialogueManager.show_dialogue_balloon_scene(Global.NAME_BALLOON,LEVEL_2_RUANGTAMU, item)
	
		"Dapur L3":
			if type != "dirt" and type != "button":
					DialogueManager.show_dialogue_balloon_scene(Global.NAME_BALLOON,LEVEL_3_RUANGTAMU, item)

		"R Keluarga L1":
			DialogueManager.show_dialogue_balloon_scene(Global.NAME_BALLOON,LEVEL_1_RUANGTAMU, item)
	
		"R Keluarga L2":
			if type != "place_here" and type != "button":
				DialogueManager.show_dialogue_balloon_scene(Global.NAME_BALLOON,LEVEL_2_RUANGTAMU, item)
	
		"R Keluarga L3":
			if type != "dirt" and type != "button":
					DialogueManager.show_dialogue_balloon_scene(Global.NAME_BALLOON,LEVEL_3_RUANGTAMU, item)


		"Halaman L1":
			DialogueManager.show_dialogue_balloon_scene(Global.NAME_BALLOON,LEVEL_1_HALAMANRUMAH, item)
		"Halaman L2":
			if type == "place_here":
				return
			if type == "button":
				return
			if type == "place":
				DialogueManager.show_dialogue_balloon_scene(Global.NAME_BALLOON,LEVEL_2_HALAMANRUMAH, "daun")
				return
			else:
				DialogueManager.show_dialogue_balloon_scene(Global.NAME_BALLOON,LEVEL_2_HALAMANRUMAH, item)
		"Halaman L3":
				DialogueManager.show_dialogue_balloon_scene(Global.NAME_BALLOON,load("res://dialogue/level_3_halamanrumah.dialogue"), item)
