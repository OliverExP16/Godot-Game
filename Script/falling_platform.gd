extends AnimatedSprite2D

@onready var start = $"."

var has_fallen: bool = false
var start_pos: Vector2

func _ready() -> void:
	start_pos = global_position
	start.play("Idle")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and !has_fallen:
		has_fallen = true

		var tween := create_tween().set_trans(Tween.TRANS_SINE)
		tween.set_parallel(true)

		tween.tween_property(self, "modulate:a", 0.0, 0.5)
		tween.finished.connect(_disable_collider)


func _disable_collider() -> void:
	$StaticBody2D/CollisionShape2D.disabled = true
	
	# nach 20 Sekunden respawn
	await get_tree().create_timer(20.0).timeout
	_respawn()


func _respawn() -> void:
	# Reset
	global_position = start_pos
	modulate.a = 1.0
	$StaticBody2D/CollisionShape2D.disabled = false
	has_fallen = false
	start.play("Idle")
