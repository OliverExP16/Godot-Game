extends Area2D

@onready var End = $Ende

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	End.play("Idle")

func _on_body_entered(body: Node2D) -> void:
		if body.is_in_group("Player"):
			get_tree().change_scene_to_file("res://Scene/Level2.tscn")
