extends Node2D
@export var camera_comp: CameraComp
const LEVEL_1_RUANGTAMU = preload("uid://bnypttcr3ehw1")
const LEVEL_2_RUANGTAMU = preload("uid://byic4evgruyd3")
const LEVEL_3_RUANGTAMU = preload("uid://bvsik370322v8")
const LEVEL_1_HALAMANRUMAH = preload("uid://ds6spugweadrc")
const LEVEL_2_HALAMANRUMAH = preload("uid://grhei24kpgii")

func _ready() -> void:
	GlobalAudio.bgm_player.stream = GlobalAudio.BGM_BERSIH_2
	GlobalAudio.bgm_player.play()
	GlobalStopwatch.stopwatch._set_paused(true)
	Global.neutral_state = false
	if !get_tree().current_scene.name.contains("L1"):
		camera_comp.camera_2d.position = Global.camera_position
	match get_tree().current_scene.name:
		"R Tamu L1":
			DialogueManager.show_dialogue_balloon_scene(Global.SOLO_BALLOON, LEVEL_1_RUANGTAMU, "start_tutorial")
			await DialogueManager.dialogue_ended
			Global.neutral_state = true
			GlobalStopwatch.stopwatch._set_paused(false)
			GlobalStopwatch.stopwatch.reset()
		"R Tamu L2":
			DialogueManager.show_dialogue_balloon_scene(Global.active_balloon,LEVEL_2_RUANGTAMU, "start_tutorial")
			await DialogueManager.dialogue_ended
			Global.neutral_state = true
		"R Tamu L3":
			DialogueManager.show_dialogue_balloon_scene(Global.active_balloon,LEVEL_3_RUANGTAMU, "start_tutorial")
			await DialogueManager.dialogue_ended
			Global.neutral_state = true
		"Dapur L1":
			DialogueManager.show_dialogue_balloon_scene(Global.active_balloon,LEVEL_1_RUANGTAMU, "start_tutorial")
			await DialogueManager.dialogue_ended
			Global.neutral_state = true
			GlobalStopwatch.stopwatch._set_paused(false)
			GlobalStopwatch.stopwatch.reset()
		"Dapur L2":
			DialogueManager.show_dialogue_balloon_scene(Global.active_balloon, LEVEL_2_RUANGTAMU, "start_tutorial")
			await DialogueManager.dialogue_ended
			Global.neutral_state = true
		"Dapur L3":
			DialogueManager.show_dialogue_balloon_scene(Global.active_balloon,LEVEL_3_RUANGTAMU, "start_tutorial")
			await DialogueManager.dialogue_ended
			Global.neutral_state = true
			
		"R Keluarga L1":
			DialogueManager.show_dialogue_balloon_scene(Global.active_balloon,LEVEL_1_RUANGTAMU, "start_tutorial")
			await DialogueManager.dialogue_ended
			Global.neutral_state = true
			GlobalStopwatch.stopwatch._set_paused(false)
			GlobalStopwatch.stopwatch.reset()
		"R Keluarga L2":
			DialogueManager.show_dialogue_balloon_scene(Global.active_balloon,LEVEL_2_RUANGTAMU, "start_tutorial")
			await DialogueManager.dialogue_ended
			Global.neutral_state = true
		"R Keluarga L3":
			DialogueManager.show_dialogue_balloon_scene(Global.active_balloon,LEVEL_3_RUANGTAMU, "start_tutorial")
			await DialogueManager.dialogue_ended
			Global.neutral_state = true
			
		"Halaman L1":
			DialogueManager.show_dialogue_balloon_scene(Global.active_balloon,LEVEL_1_HALAMANRUMAH, "start_tutorial")
			await DialogueManager.dialogue_ended
			Global.neutral_state = true
			GlobalStopwatch.stopwatch._set_paused(false)
			GlobalStopwatch.stopwatch.reset()
		"Halaman L2":
			DialogueManager.show_dialogue_balloon_scene(Global.active_balloon,LEVEL_2_HALAMANRUMAH, "start_tutorial")
			await DialogueManager.dialogue_ended
			Global.neutral_state = true

func _process(delta: float) -> void:
	Global.camera_position = camera_comp.camera_2d.position
	
func _on_item_counter_level_end() -> void:
	await DialogueManager.dialogue_ended
	var instance = Global.RETURN.instantiate()
	add_child(instance)
	$Return.reparent(%CanvasShow)
