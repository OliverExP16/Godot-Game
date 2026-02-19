extends Area2D

@onready var End = $Ende
var count:int = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	End.play("Idle")

func _on_body_entered(body: Node2D) -> void:
		count += 1
		if body.is_in_group("Player"):
			get_tree().change_scene_to_file("res://Scene/Level" + str(count) + ".tscn")
