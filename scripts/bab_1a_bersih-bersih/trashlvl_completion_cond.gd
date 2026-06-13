class_name ItemCounter extends Node2D

@export var level_type: String = ""
var complete_count: int 
var item_count: int = 0
var current_scene : String
var key_item_dialogue : bool = true
var level_end_dialogue: bool = true
signal level_end
var no_dialogue : bool

const LEVEL_1_RUANGTAMU = preload("uid://bnypttcr3ehw1")
const LEVEL_2_RUANGTAMU = preload("uid://byic4evgruyd3")
const LEVEL_3_RUANGTAMU = preload("uid://bvsik370322v8")
const LEVEL_1_HALAMANRUMAH = preload("uid://ds6spugweadrc")
const LEVEL_2_HALAMANRUMAH = preload("uid://grhei24kpgii")

func _ready() -> void:
	current_scene = get_tree().current_scene.name
	item_count = 0
	complete_count = get_child_count()
	if level_type == "trash":
		Global.key_item_found = false
	if level_type == "place":
		print("scene changed")

func _process(delta: float) -> void:
	if item_count == complete_count:
		match current_scene:
			"R Tamu L1":
				if Global.neutral_state == true:
					get_tree().change_scene_to_file("uid://burky16jrejdu")
			"R Tamu L2":
				if Global.neutral_state == true:
					get_tree().change_scene_to_file("uid://bu27qv4lml2oe") 
			"R Tamu L3":
				%Tools.visible = false
				match Global.key_item_found:
					false:
						if key_item_dialogue == true:
							key_item_dialogue = false
							await DialogueManager.dialogue_ended
							DialogueManager.show_dialogue_balloon_scene(Global.SOLO_BALLOON, LEVEL_3_RUANGTAMU, "find_key")
							
					true:
						if level_end_dialogue == true:
							level_end_dialogue = false
							await DialogueManager.dialogue_ended
							DialogueManager.show_dialogue_balloon_scene(Global.SOLO_BALLOON, LEVEL_3_RUANGTAMU, "level_end_r_tamu")
							await DialogueManager.dialogue_ended
							emit_signal("level_end")
			"Dapur L1":
				if Global.neutral_state == true:
					get_tree().change_scene_to_file("uid://6m43cuhiaxx1")
			"Dapur L2":
				if Global.neutral_state == true:
					get_tree().change_scene_to_file("uid://l44rj73c4b8w")
			"Dapur L3":
				%Tools.visible = false
				if level_end_dialogue == true:
							level_end_dialogue = false
							await DialogueManager.dialogue_ended
							DialogueManager.show_dialogue_balloon_scene(Global.SOLO_BALLOON,LEVEL_3_RUANGTAMU, "level_end_dapur")
							await DialogueManager.dialogue_ended
							emit_signal("level_end")
							
			"R Keluarga L1":
				if Global.neutral_state == true:
					get_tree().change_scene_to_file("uid://bp3epw7vdyhyr")
			"R Keluarga L2":
				if Global.neutral_state == true:
					get_tree().change_scene_to_file("uid://dbgspdds2c3hf") 
			"R Keluarga L3":
				%Tools.visible = false
				if level_end_dialogue == true:
							level_end_dialogue = false
							await DialogueManager.dialogue_ended
							DialogueManager.show_dialogue_balloon_scene(Global.SOLO_BALLOON,LEVEL_3_RUANGTAMU, "level_end_dapur")
							await DialogueManager.dialogue_ended
							emit_signal("level_end")
				
				
			"Halaman L1":
				if Global.neutral_state == true:
					get_tree().change_scene_to_file("uid://ddey02hnlfjod")
			"Halaman L2":
				if Global.neutral_state == true:
					get_tree().change_scene_to_file("uid://cx3xlkl0vcxat")
