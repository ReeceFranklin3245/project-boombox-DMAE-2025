extends Node2D

signal gearGet(num)

@export var gearNum:int = 0

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("gearGet")
		gearGet.emit(gearNum)
		queue_free()

func _on_tree_entered() -> void:
	connect("gearGet",Callable(get_parent().get_parent().get_parent(),"_gearGet"))
