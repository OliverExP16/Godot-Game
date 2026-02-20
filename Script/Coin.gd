extends Area2D

@onready var anim = $coinAnimation
@onready var coin_sound = $CoinSound
@onready var col = $CollisionShape2D

func _ready() -> void:
	anim.play("default")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		hide()
		GameManager.add_point()
		col.disabled = true
		coin_sound.play()
		await coin_sound.finished
		queue_free()
