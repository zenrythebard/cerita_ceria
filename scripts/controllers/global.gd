extends Node

var object_type: String
var neutral_state: bool = true
var key_item_found: bool = false
var camera_position: Vector2
var engaged_items : Array = []
var dialogue_on : bool
var previous_scene_path : String = ""

var SOLO_BALLOON = load("uid://craj2egm38fht")
var NO_BALLOON = load("uid://cgrvjjmbv8yn6")
var TUTORIAL_BALLOON = load("uid://codnavram0hot")
var RETURN = load("uid://b41i6wxa0ptyc")
var active_balloon = SOLO_BALLOON

func save_prev_scene():
	previous_scene_path = get_tree().current_scene.scene_file_path


##_________________LEVELS__________________##
var load_level    
const LEVEL_R_TAMU_A_1 = "uid://dhxodxm2g7id"
const LEVEL_DAPUR_1 = "uid://bf2vu7c4mxiag"
const LEVEL_R_KELUARGA_1 = "uid://jhr7r0qays7y"


const LEVEL_HALAMAN_1 = "uid://d1ioym628ws5q"
const LEVEL_MEMILAH_1 = "uid://uao2xgwbmgip"
const LEVEL_MENGENAL_PANTAI = "uid://btwl2bedjvolo"
const LEVEL_MENGENAL_TAMAN = "uid://bjxsi88aqpral"

const LEVEL_SAYANGI_TANAMAN_LV_1 = "uid://c436lbksu3ecs"
