class_name ExploreControl extends Node2D
var rng = RandomNumberGenerator.new()
var condition_type : String
var condition_color : String
var check_condition : int #1=type 2=natural 3=type&color
var correct_count : int = 0
@export var correct_target : int
var final_random : bool = false
var check2 : bool = true
var check3 : bool = true
var check4 : bool = true
var clicked_items_count : int = 0
var clicked_items_list : Array = []
var correct_state : int = 0
var current_item : String
var current_type : String
@onready var current_scene : String = get_tree().current_scene.name
const LEVEL_PANTAI = preload("uid://bmata2ccep7i7")
const LEVEL_TAMAN = preload("uid://ddfn2gkgtnb28")

signal level_end
signal end_dialogue
var load_dialogue : Resource

func _ready() -> void:
	correct_count = 0
	condition_type = "hidup"
	check_condition = 1
	
	#DIALOGUE
	match current_scene:
		"MengenalPantai L1":
			load_dialogue = LEVEL_PANTAI
		"MengenalTaman L1":
			load_dialogue = LEVEL_TAMAN
	
	GlobalStopwatch.stopwatch._set_paused(true)
	Global.neutral_state = false
	DialogueManager.show_dialogue_balloon_scene(Global.active_balloon,load_dialogue, "start_tutorial")
	await DialogueManager.dialogue_ended
	Global.neutral_state = true
	GlobalStopwatch.stopwatch._set_paused(false)
	GlobalStopwatch.stopwatch.reset()
	
func _physics_process(delta: float) -> void:
	if correct_count >= correct_target:
		check_condition += 1
		correct_count = 0
	if check_condition == 3:
		if correct_count >= 1:
			check_condition += 1
			correct_count = 0
		if final_random == true:
			return
		randomize_type()
		if condition_type == "mati":
			randomize_color()
		if condition_type == "hidup":
			var check_type : int = rng.randi_range(0, 2)
			match check_type:
				0: condition_color = "merah"
				1: condition_color = "putih"
				2: condition_color = "hijau"
		final_random = true
	

func _input(event: InputEvent) -> void:
	dialogue_handler()

func randomize_color():
	var check_color : int
	match current_scene:
		"MengenalPantai L1":
			check_color = rng.randi_range(1, 5)
		"MengenalTaman L1":
			check_color = rng.randi_range(1, 6)
	match check_color:
		1: condition_color = "merah"
		2: condition_color = "cokelat"
		3: condition_color = "hijau"
		4: condition_color = "biru"
		5: condition_color = "putih"
		6: condition_color = "kuning"

func randomize_type():
	var check_type : int = rng.randi_range(0, 1)
	match check_type:
		0: condition_type = "mati"
		1: condition_type = "hidup"

func dialogue_handler():
	if correct_state == 1:
		DialogueManager.show_dialogue_balloon_scene(Global.active_balloon, load_dialogue, "correct")
		correct_state = 0
	if correct_state == 2:
		match check_condition:
			1:
				DialogueManager.show_dialogue_balloon_scene(Global.active_balloon, load_dialogue, "wrongcheck1")
			2:
				if current_type == "hidup":
					DialogueManager.show_dialogue_balloon_scene(Global.active_balloon, load_dialogue, "wrongcheck2_1")
				else:
					DialogueManager.show_dialogue_balloon_scene(Global.active_balloon, load_dialogue, "wrongcheck2_2")
			3:
				DialogueManager.show_dialogue_balloon_scene(Global.active_balloon, load_dialogue, "wrongcheck3")
		correct_state = 0
	await DialogueManager.dialogue_ended
	await get_tree().create_timer(1).timeout
	emit_signal("end_dialogue")
	
	

func _on_end_dialogue() -> void:
	if check_condition == 2 and check2 == true:
		check2 = false
		DialogueManager.show_dialogue_balloon_scene(Global.active_balloon, load_dialogue, "check2")
	if check_condition == 3 and check3 == true:
		check3 = false
		DialogueManager.show_dialogue_balloon_scene(Global.active_balloon,load_dialogue, "check3")
		await DialogueManager.dialogue_ended
		await get_tree().create_timer(1).timeout
		DialogueManager.show_dialogue_balloon_scene(Global.active_balloon,load_dialogue, condition_type + condition_color)
	if check_condition == 4 and check4 == true:
		check4 = false
		DialogueManager.show_dialogue_balloon_scene(Global.active_balloon,load_dialogue, "check4")
		await DialogueManager.dialogue_ended
		await get_tree().create_timer(1).timeout
		emit_signal("level_end")
