extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D; 
@onready var Player = $CollisionPlayer; 
@onready var PlayerJumpsound = $Jump
@export var coin_tile_id: int

const SPEED = 130.0
const JUMP_VELOCITY = -320.0
var took_damage = false  
var Current_timer = 0 
var Limit_timer = 30 
var Limit_end = 120
@export var spawn_position: Vector2

func respawn():
	global_position = spawn_position
	velocity = Vector2.ZERO
	took_damage = false 	
	
func _physics_process(delta: float) -> void:
	var active = (
		Input.is_action_just_pressed("Links")
		or 
		Input.is_action_just_pressed("Rechts")
		or 
		Input.is_action_just_pressed("Jump")
	)
	

	if active: 
		Current_timer = 0 
	else: 
		Current_timer += delta 
		
	# Gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	#Collision for the Spikes 
	for i in range(get_slide_collision_count()): 
		var collision = get_slide_collision(i)
		
		if collision.get_collider().name == "Spikes": 
			if took_damage == false: 
				took_damage = true
				respawn()
				
	# Jump
	if Input.is_action_just_pressed("Jump") and is_on_floor(): 
		PlayerJumpsound.play()
		velocity.y = JUMP_VELOCITY 
	
	
	
	var direction := Input.get_axis("Links", "Rechts")
	if direction:
		velocity.x = direction * SPEED
		animated_sprite.flip_h = direction < 0; 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Animationen
	if not is_on_floor():
		if velocity.y < -10:
			animated_sprite.play("Jump")
		elif velocity.y > 10:
			animated_sprite.play("Fall")
		else:
			animated_sprite.play("Jump") # oder "Fall" oder eigene "Float"
	else:
		if direction:
			animated_sprite.play("Run")
			animated_sprite.flip_h = direction < 0
		else:
			if Current_timer >= Limit_end: 
				animated_sprite.play("Idle_80")
			elif Current_timer >= Limit_timer: 
				animated_sprite.play("Idle_30")
			else: 
				animated_sprite.play("Idle")
			
	move_and_slide()

func bounce(force: float): 
	velocity.y = force
	
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Title Screen.tscn")
