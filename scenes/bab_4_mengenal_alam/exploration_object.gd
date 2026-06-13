class_name ExplorationObject extends Node2D
@onready var click_sprite: ClickSprite = $ClickSprite
@onready var canvas_show: CanvasLayer = %CanvasShow
@onready var interactible: ExploreControl = %Interactible
@export var item_color : String
@export var benda_hidup : bool
@export var benda_alam : bool
var type : String
var item: String
var correct : bool  
var interacted : bool = false

signal showcase_finished

func _ready() -> void:
	item = self.name
	if benda_hidup: 
		type = "hidup"
		return
	else:
		type = "mati"
		return

func _on_click_sprite_neutral_pressed() -> void:
	interactible.current_item = name
	var prev_parent : Node2D = $".."
	check_cond()
	if interacted:
		return
		
	Global.neutral_state = false
	var current_pos : Vector2 = position
	var current_scale : Vector2 = scale
	var current_rot : float = rotation_degrees
	var current_mod : Color = modulate
	reparent(canvas_show)
	position = Vector2(1920, 1080)
	modulate = Color(1, 1, 1, 0)
	showcase()
	await showcase_finished
	await get_tree().create_timer(0.5).timeout
	reparent(prev_parent)
	position = current_pos
	scale = current_scale
	rotation_degrees = current_rot
	modulate = current_mod 
	if correct == true:
		interactible.correct_count += 1
	if interactible.clicked_items_list.has(item) == false: 
		interactible.clicked_items_list.append(item)
		interactible.clicked_items_count += 1
	Global.neutral_state = true
	interactible.current_item = ""

func showcase():
	var tween = get_tree().create_tween()
	interactible.current_item = item
	interactible.current_type = type
	if correct:
		interactible.correct_state = 1
		tween.set_parallel(true)
		tween.tween_property(self, "modulate", Color(1, 1, 1, 1), 0.5)
		if scale / Vector2(2.2, 2.2) >= Vector2(1.1, 1.1):
			tween.tween_property(self, "scale", Vector2(4, 4), 0.5)
		if scale / Vector2(2.2, 2.2) < Vector2(1.1, 1.1):
			tween.tween_property(self, "scale", Vector2(4, 4), 0.5)
		tween.tween_property(self, "rotation", rotation_degrees + 0.5, 0.5)
		tween.set_parallel(false)
		tween.tween_property(self, "rotation", rotation_degrees - 0.5, 0.4)
		tween.tween_property(self, "rotation", rotation_degrees + 0.5, 0.4)
		tween.tween_property(self, "rotation", rotation_degrees - 0.5, 0.4)
		tween.tween_property(self, "rotation", rotation_degrees + 0.5, 0.4)
		await tween.finished
		interacted = true
		emit_signal("showcase_finished")
	else:
		interactible.correct_state = 2
		tween.set_parallel(true)
		tween.tween_property(self, "modulate", Color(1, 1, 1, 1), 0.5)
		if scale / Vector2(2.2, 2.2) >= Vector2(1.1, 1.1):
			tween.tween_property(self, "scale", Vector2(4, 4), 0.5)
		if scale / Vector2(2.2, 2.2) < Vector2(1.1, 1.1):
			tween.tween_property(self, "scale", Vector2(4, 4), 0.5)
		tween.tween_property(click_sprite, "offset", Vector2(60, click_sprite.position.y), 0.2)
		tween.set_parallel(false)
		tween.tween_property(click_sprite, "offset", Vector2(-120, click_sprite.position.y), 0.2)
		tween.tween_property(click_sprite, "offset", Vector2(120, click_sprite.position.y), 0.2)
		tween.tween_property(click_sprite, "offset", Vector2(-120, click_sprite.position.y), 0.2)
		tween.tween_property(click_sprite, "offset", Vector2(120, click_sprite.position.y), 0.2)
		tween.tween_property(click_sprite, "offset", Vector2(-60, click_sprite.position.y), 0.2)
		await tween.finished
		emit_signal("showcase_finished")

func check_cond():
	match interactible.check_condition:
		1: #type only
			if interactible.condition_type == type:
				correct = true
			else:
				correct = false
		2: #natural
			if benda_alam:
				correct = true
			else: 
				correct = false
		3: #color and type
			interacted = false
			if interactible.condition_color == item_color and interactible.condition_type == type:
				correct = true
			else:
				correct = false
