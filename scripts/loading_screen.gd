extends Node2D

@onready var button: Button = $Button
@onready var progress_bar: ProgressBar = $ProgressBar
var next_scene_path = Global.LEVEL_MEMILAH_1
var progress : Array[float] = []

func _ready():
	DialogueManager.show_dialogue_balloon_scene(Global.TUTORIAL_BALLOON, preload("uid://c2eol7yukc1jx"))
	next_scene_path = Global.load_level
	ResourceLoader.load_threaded_request(next_scene_path)
	button.disabled = true
	
func _process(delta: float) -> void:
	var status = ResourceLoader.load_threaded_get_status(next_scene_path, progress)
	
	match status:
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			var pct = progress[0] * 100
			progress_bar.value = pct
		ResourceLoader.THREAD_LOAD_LOADED:
			button.disabled = false
			progress_bar.value = 100

func _on_button_pressed() -> void:
	var scene = ResourceLoader.load_threaded_get(next_scene_path)
	get_tree().change_scene_to_packed(scene)
