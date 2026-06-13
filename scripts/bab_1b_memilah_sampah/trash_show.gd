extends Node2D

#--------ASET ANORGANIK-----------
const BOTOL_PLASTIK = preload("uid://b3rgr54qpaj6e")
const BUMBU_SASET = preload("uid://dn7tpfmt6gm8d")
const KALENG_BEKAS = preload("uid://c0u5w44pt1uja")
const TELUR_KOSONG = preload("uid://blq0rx5ocplwr")
const SUSU_KOTAK = preload("uid://dt3ic0uf6nqa")
const SNACK = preload("uid://dwc5glqkg3uc1")
const ES_CEKEK = preload("uid://ij0ixnyheqt6")
#-----------ASET ORGANIK-------------
const CANGKANG_TELUR = preload("uid://baowswyg0adpm")
const DAUN_KERING_1 = preload("uid://db37xqpvgy5y")
const DAUN_KERING_2 = preload("uid://cg5tqijhxlylc")
const KULIT_APEL = preload("uid://cs6a0a2ogix1v")
const KULIT_PISANG = preload("uid://115c8cxypj0y")
const TULANG_AYAM = preload("uid://d2hys3oainirl")
const TULANG_IKAN = preload("uid://d4c1n5iam3vi3")

#----------Variables----------------
@onready var trash_sprite: Sprite2D = $TrashSprite
@export var bin_a : SortBin
@export var bin_o : SortBin
@export var object_count : int
@export var total_count : int
var correct_count : int = 0
var interacted : bool = false
var bin_id : int = 0 
var organic : bool
var rng = RandomNumberGenerator.new()
var prev_num : int = 0
var prev_check : int 
signal right_bin
signal wrong_bin
signal level_complete


func _ready() -> void:
	await get_tree().create_timer(3).timeout
	trash_randomizer()

func trash_randomizer():
	print(correct_count)
	print(total_count)
	if correct_count == total_count:
		emit_signal("level_complete")
		print("end")
		return

	interacted = false
		
	var check : int = rng.randi_range(0, 20)
	if check != prev_check:
		prev_check = check
	else:
		check = rng.randi_range(0, 20)
		
	if check >= 10:
		organic = true
	else:
		organic = false
		
	var num : int = rng.randi_range(1, object_count)
	if num != prev_num:
		prev_num = num
	else:
		num = rng.randi_range(1, object_count)
	if organic:
		match num:
			1: trash_sprite.texture = CANGKANG_TELUR #telur
			2: trash_sprite.texture = DAUN_KERING_1 #daun1
			3: trash_sprite.texture = DAUN_KERING_2 #daun2
			4: trash_sprite.texture = KULIT_PISANG #pisang
			5: trash_sprite.texture = KULIT_APEL #apel
			6: trash_sprite.texture = TULANG_AYAM #tulangayam
			7: trash_sprite.texture = TULANG_IKAN #tulangikan
	else: 
		match num:
			1: trash_sprite.texture = BOTOL_PLASTIK #botol
			2: trash_sprite.texture = BUMBU_SASET #saset
			3: trash_sprite.texture = KALENG_BEKAS #kaleng
			4: trash_sprite.texture = SUSU_KOTAK #susu
			5: trash_sprite.texture = SNACK #kemasan
			6: trash_sprite.texture = ES_CEKEK #escekek
			7: trash_sprite.texture = TELUR_KOSONG #kartontelur
	move_to_screen()

func move_to_screen():
	var tween = get_tree().create_tween()
	scale = Vector2.ONE
	position = Vector2(1920, -500)
	modulate = Color(1, 1, 1, 1)
	tween.tween_property(self, "position", Vector2(1920, 600), 1)

func _on_bin_organic_pressed() -> void:
	print("pressed")
	bin_id = 1 
	check_correct_bin()

func _on_bin_anorganic_pressed() -> void:
	bin_id = 2
	print("pressed")
	check_correct_bin()
	
func check_correct_bin():
	if interacted == true:
		if bin_id == 1 and organic == true or bin_id == 2 and organic == false:
			emit_signal("right_bin")
		else:
			emit_signal("wrong_bin")
	elif bin_id == 0:
		pass
	elif bin_id == 1 and organic == true or bin_id == 2 and organic == false:
		correct_count += 1
		interacted = true
		emit_signal("right_bin")
	else:
		interacted = true
		emit_signal("wrong_bin")


func _on_right_bin() -> void:
	bin_id = 0
	var tween = get_tree().create_tween()
	var bin_pos : Vector2
	if organic == true:
		bin_pos = bin_o.position
	else:
		bin_pos = bin_a.position
	tween.set_parallel(true)
	tween.tween_property(self, "position", bin_pos, 0.6)
	tween.tween_property(self, "scale", Vector2(0.2, 0.2), 0.6)
	tween.set_parallel(false)
	tween.tween_property(self, "modulate", Color(1, 1, 1, 0), 1)
	await tween.finished
	trash_randomizer()
	Global.neutral_state = true
	

func _on_wrong_bin() -> void:
	bin_id = 0
	var tween = get_tree().create_tween()
	tween.tween_property(trash_sprite, "offset", Vector2(40, trash_sprite.position.y), 0.2)
	tween.tween_property(trash_sprite, "offset", Vector2(-80, trash_sprite.position.y), 0.2)
	tween.tween_property(trash_sprite, "offset", Vector2(80, trash_sprite.position.y), 0.2)
	tween.tween_property(trash_sprite, "offset", Vector2(-40, trash_sprite.position.y), 0.2)
	await tween.finished
	Global.neutral_state = true
