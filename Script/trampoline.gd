extends Area2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play("Idle")
	
	


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"): 
		animation.play("Jump")
		if body.global_position.y > 0:  
			body.bounce(-450)
			animation.play("Jump")




func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"): 
		animation.play("Idle")
