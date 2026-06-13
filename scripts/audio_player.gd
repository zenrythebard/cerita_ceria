extends Node
@onready var bgm_player: AudioStreamPlayer = $BGMPlayer
@onready var sfx_player: AudioStreamPlayer = $SFXPlayer

const SFX_WIN_1 = preload("uid://oe0rf8a4rij3")
const SFX_WIN_2 = preload("uid://bpcbhhape4oh3")

const SFX_LOSE_1 = preload("uid://cpk14vrsdavtt")
const SFX_LOSE_2 = preload("uid://o13nc76g8whb")

const SFX_WRONG_1 = preload("uid://dqeeywj0rrjks")
const SFX_WRONG_2 = preload("uid://qi1inbejlfud")

const SFX_POP = preload("uid://dq2vpqv5nnbrg")
 
const BGM_MEMILAH_SAMPAH = preload("uid://cas1c6oacm5av")
const BGM_HAPPY_DAY = preload("uid://cwhv2svojn320")
const BGM_PANTAI = preload("uid://255kq1ui8q8u")
const BGM_TAMAN = preload("uid://sn8dgvi3ljhb")
const BGM_GENERAL = preload("uid://dl2h1py1bkttw")
const BGM_BERSIH_2 = preload("uid://bcigrhe8ahg41")
