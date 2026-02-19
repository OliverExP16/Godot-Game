extends Area2D

func _on_body_entered(body: Node2D) -> void:
		if body.is_in_group("Player"):
			body.respawn()


func _on_death_zone_e_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"): 
		body.respawn()
		
		
