extends Node

@export var SETTINGS = {
	"MusicVolume":99,
	}
enum controlers{GAMEPAD,MOUSE}
var curControler: controlers

@export var pal_:Texture2D
@export var pal_r:Texture2D
@export var pal_rb:Texture2D																																																																																				
@export var pal_rbg:Texture2D

var lvl_scene:Node2D
var lvl_shader:Shader

@export var DEBUG = false
@export var startState: String 
var GAMESTATE

func changeState(path):
	var gamestate_scene: PackedScene
	if get_child_count() > 0: 
		remove_child(GAMESTATE)
		GAMESTATE.queue_free()
		
	if path != "":
		gamestate_scene = load(path)
	GAMESTATE = gamestate_scene.instantiate()
	add_child(GAMESTATE,true)
	return GAMESTATE

func _ready():
	if startState != null:
		lvl_scene = changeState(startState)
	JavaScriptBridge.eval("consoleMsg",true)

func get_scene_shader():
	lvl_scene.material
	#lvl_shader = 

func swap_pal():
	pass
