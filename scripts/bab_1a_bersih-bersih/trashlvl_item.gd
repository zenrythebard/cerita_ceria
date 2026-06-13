class_name TrashItem extends Node2D

@onready var sprite : Sprite2D = $Sprite
@onready var anim_player : AnimationPlayer = $AnimationPlayer
@onready var send: Control = %SendToRoom
@export var destroy: bool = false
@export var type : String
@export var item : String
@export var move_to : int
@export var item_counter : Node2D
var engaged_item : String
var get_pos : Vector2 = self.position
var get_rot : float = self.rotation
@export var hide_place : bool = false

func _ready() -> void:
	sprite.type = type
	sprite.item = item
	if type == "place_here":
		visible = false
	
func _process(_delta: float) -> void:
	if Global.engaged_items.has(item) and type == "place_here":
		visible = true
	if destroy:
		Global.neutral_state = true
		item_counter.item_count += 1
		print(item_counter.item_count)
		queue_free()
	if Global.engaged_items.has(item + "_remove") and type == "place":
		destroy = true
	if get_tree().current_scene.name.contains("L2"):
		if send.active and type == "move":
			check_send()

func _on_sprite_trash_pressed() -> void:
	anim_player.play("collect_animation")
	anim_player.seek(0)
	await get_tree().create_timer(0.6).timeout
	reparent(%CanvasShow)
	anim_player.play("showcase_animation")
	anim_player.seek(0)

func _on_sprite_other_pressed() -> void:
	get_pos = self.global_position
	reparent(%CanvasShow)
	anim_player.play("showcase_other")
	anim_player.seek(0)
	await get_tree().create_timer(2.1).timeout
	reparent(%Interactible)
	anim_player.play("RESET")
	self.global_position = get_pos
	Global.neutral_state = true

func _on_sprite_placable_pressed() -> void:
	reparent(%CanvasShow)
	anim_player.play("hold_animation")
	anim_player.seek(0)
	await get_tree().create_timer(1.7).timeout
	Global.engaged_items.append(item) 
	
	var hold_count = Global.engaged_items.find(item) 
	var tween = create_tween()
	var hold_offset : float = hold_count * 500
	z_index = hold_count
	tween.set_parallel()
	tween.tween_property(self, "position", Vector2(3500, 400 + hold_offset), 1)
	Global.neutral_state = true
	print(Global.engaged_items)
	await tween.loop_finished

func _on_sprite_place_here_pressed() -> void:
	if Global.engaged_items.has(item):
		anim_player.play("place_animation")
		anim_player.seek(0)
		Global.engaged_items.erase(item)
		DialogueManager.show_dialogue_balloon_scene(Global.NO_BALLOON, preload("uid://byic4evgruyd3"), "place_here")
		await get_tree().create_timer(1.7).timeout
		Global.neutral_state = true
		Global.engaged_items.append(item + "_remove")
		print(Global.engaged_items)
		await get_tree().create_timer(1.7).timeout
		Global.engaged_items.erase(item + "_remove")
		if hide_place:
			var tween = get_tree().create_tween()
			tween.tween_property(self, "modulate:a", 0, 1)
		print(Global.engaged_items)
	else:
		await get_tree().create_timer(0.1).timeout
		Global.neutral_state = true

func _on_sprite_moveable_pressed() -> void:
	get_pos = self.position
	get_rot = self.rotation
	reparent(%CanvasShow)
	anim_player.play("holdshow_animation")
	anim_player.seek(0)
	send.active = true 

func check_send():
	if send.button_pressed == move_to and send.button_pressed != 0:
		send.button_pressed = 0
		send.active = false
		anim_player.play("movetoroom_animation")
		anim_player.seek(0)
		await get_tree().create_timer(1.1).timeout
		Global.neutral_state = true
		send.button_pressed = 0
		
	if send.button_pressed != move_to and send.button_pressed != 0:
		send.button_pressed = 0
		anim_player.play("fail_animation")
		anim_player.seek(0)
		await get_tree().create_timer(1.1).timeout
		anim_player.play("RESET")
		reparent(item_counter)
		self.position = get_pos
		self.rotation = get_rot
		send.active = false
		Global.neutral_state = true
		send.button_pressed = 0
