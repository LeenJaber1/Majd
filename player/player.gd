extends CharacterBody2D

@onready var camera = $Camera2D
const SPEED = 350
var JUMP_VELOCITY = -550
@onready var walk_audio = $walkAudio
@onready var jump_audio = $AudioStreamPlayer2D
@onready var audioTimer = $Timer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	camera.position_smoothing_enabled = true
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump_audio.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			if audioTimer.time_left <= 0:
				walk_audio.pitch_scale = randf_range(0.8, 1.2)
				walk_audio.play()
				audioTimer.start(0.3)
			animated_sprite.play("walk")
	else:
		if velocity.y < 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("jumpLoop")
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_ready():
	JUMP_VELOCITY = GameManager.get_jump()
	if GameManager.isDefault:
		global_position = GameManager.get_default_player_position()
	else:
		global_position = GameManager.get_player_position()
