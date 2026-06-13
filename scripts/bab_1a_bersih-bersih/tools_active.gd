extends Control

var button_pressed : int = 0
@onready var button1: Clickable = $Button1
@onready var button2: Clickable = $Button2
@onready var button3: Clickable = $Button3
const NORMAL = preload("uid://bl083kxeo6qp4")
const PRESSED = preload("uid://1f21qmhw7wu7")

func _ready() -> void:
	visible = false
	await DialogueManager.dialogue_ended
	visible = true
	button_sprite()

func button_sprite():
	match button_pressed:
		0:
			button1.texture = NORMAL
			button2.texture = NORMAL
			button3.texture = NORMAL
		1:
			button1.texture = PRESSED
			button2.texture = NORMAL
			button3.texture = NORMAL
		2:
			button1.texture = NORMAL
			button2.texture = PRESSED
			button3.texture = NORMAL
		3:
			button1.texture = NORMAL
			button2.texture = NORMAL
			button3.texture = PRESSED

func _on_button_1_button_pressed() -> void:
	button_pressed = 1 #Kemoceng
	button_sprite()

func _on_button_2_button_pressed() -> void:
	button_pressed = 2 #Sapu
	button_sprite()

func _on_button_3_button_pressed() -> void:
	button_pressed = 3 #Pel
	button_sprite()
