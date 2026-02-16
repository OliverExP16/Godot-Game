extends Node2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Start"): 
		get_tree().change_scene_to_file("res://Scene/Level1.tscn"); 
