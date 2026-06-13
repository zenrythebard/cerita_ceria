extends Node2D

@onready var sprite : Sprite2D = $Sprite
@onready var tool : Control = %Tools
@export var type : String
@export var item : String
@export var dirt_stage : int
@export var item_counter : Node2D
@export var animation_player : AnimationPlayer
var engaged_item : String
var get_pos : Vector2 = self.position
const DEBU = preload("uid://clru6io8s8xcp")
const BEKAS = preload("uid://4eckhmcitwlj")
var dia_show : String

func _ready() -> void:
	dirt_stage_equiv()
	print (dirt_stage)
	type = "dirt"
	sprite.type = type
	sprite.item = item
	
func dirt_stage_equiv():
	match dirt_stage:
		0:
			visible = false
			item_counter.item_count += 1
			print(item_counter.item_count)
			await get_tree().create_timer(2).timeout
			tool.visible = true
			Global.neutral_state = true
			queue_free()
		1:
			item = "bekas"
			sprite.texture = BEKAS
		2:
			item = "debu_bawah"
			sprite.texture = DEBU
		3:
			item = "debu_permukaan"
			sprite.texture = DEBU

func _on_sprite_dirt_pressed() -> void:
	tool.visible = false
	match dirt_stage:
		0:
			dirt_stage_equiv()
		1: #pel
			if tool.button_pressed == 3:
				animation_player.play("pel_animation")
				dia_show = "success"
				dirt_stage -= 1
			elif tool.button_pressed == 0:
				dia_show = "neutral"
				animation_player.play("RESET")
			else:
				dia_show = "fail"
				animation_player.play("RESET")
				
		2: #sapu
			if tool.button_pressed == 2:
				animation_player.play("sapu_animation")
				dia_show = "half"
				dirt_stage -= 1
			elif tool.button_pressed == 0:
				dia_show = "neutral"
				animation_player.play("RESET")
			else:
				dia_show = "fail"
				animation_player.play("RESET")
		3: #kemoceng
			if tool.button_pressed == 1:
				animation_player.play("kemoceng_animation")
				dia_show = "success"
				dirt_stage -= 3
			elif tool.button_pressed == 0:
				dia_show = "neutral"
				animation_player.play("RESET")
			else:
				dia_show = "fail"
				animation_player.play("RESET")
	await animation_player.animation_finished
	animation_player.play("RESET")
	dialogue_show()
	dirt_stage_equiv()
	await DialogueManager.dialogue_ended
	tool.visible = true
	Global.neutral_state = true


func dialogue_show():
	DialogueManager.show_dialogue_balloon_scene(Global.SOLO_BALLOON,load("res://dialogue/level_3_ruangtamu.dialogue"), dia_show)
