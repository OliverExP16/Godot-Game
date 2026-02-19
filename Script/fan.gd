extends StaticBody2D

@export var force := 1200
@onready var animation = $AnimatedSprite2D
var playerBody 

func _ready() -> void:
	animation.play("On")

func _physics_process(delta: float) -> void:
	if playerBody: playerBody.velocity.y -= force * delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		playerBody = body

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"): 
		playerBody = null
