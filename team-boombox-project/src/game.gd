extends Node2D

@onready var lvlShader:ShaderMaterial = preload("res://assets/lvlShader.tres")
@onready var lvlAudio:AudioStreamSynchronized = preload("res://assets/music/SynchAudio.tres")

@export_category("Palattes")

@export var pal_:CompressedTexture2D
@export var pal_r:CompressedTexture2D
@export var pal_rb:CompressedTexture2D																																																																																				
@export var pal_rbg:CompressedTexture2D

@onready var palattes = {
	0:pal_,
	1:pal_r,
	2:pal_rb,
	3:pal_rbg
	}
	
var currentPal = 0
var curRoom:Node2D

func _ready() -> void:
	curRoom = $Room.get_child(0)

func _physics_process(delta: float) -> void:
	pass

func _loadRoom(RoomScene:PackedScene):
	$Entities/Player.position = curRoom.get_node("NewPlayerPos").position
	await get_tree().process_frame
	var NewRoom = RoomScene.instantiate()
	NewRoom.hide()
	$Room.add_child(NewRoom)
	curRoom.hide()
	NewRoom.show()
	curRoom.queue_free()
	curRoom = NewRoom
	
	

#Checks if a gear has already been grabbed
func gearCheck():
	pass

func swap_pal(newPal):
	lvlShader.set_shader_parameter("palette",newPal)

func swap_mus():
	lvlAudio.set_sync_stream_volume(currentPal,0)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("debug1") && get_parent().DEBUG:
		currentPal = (currentPal + 1) % 4
		var newPal = palattes[currentPal]
		swap_pal(newPal)
		swap_mus()

func _gearGet(num):
	currentPal = num
	var newPal = palattes[currentPal]
	swap_pal(newPal)
	swap_mus()
