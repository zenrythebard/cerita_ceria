extends Control
var active : bool = false
var button_pressed : int = 0
@onready var button1: Clickable = $Button1
@onready var button2: Clickable = $Button2
@onready var button3: Clickable = $Button3

func _ready() -> void:
	active = false

func _physics_process(delta: float) -> void:
	check_active()
	
func check_active():
	match active:
		false:
			visible = false
			button1.disabled = true
			button2.disabled = true
			button3.disabled = true
		true:
			await DialogueManager.dialogue_ended
			visible = true
			button1.disabled = false
			button2.disabled = false
			button3.disabled = false

func _on_button_1_button_pressed() -> void:
	button_pressed = 1 #Dapur
	
func _on_button_2_button_pressed() -> void:
	button_pressed = 2 #R. Cuci Baju

func _on_button_3_button_pressed() -> void:
	button_pressed = 3 #K. Tidur
