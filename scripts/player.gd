class_name Player
extends CharacterBody2D

@onready var animated_sprite_node: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player_node: AudioStreamPlayer = $AudioStreamPlayer

@export var accel_y: float = 1500
@export var flap_height: float = -350
@export var max_vel_y: float = 400
@export var max_rot: float = 45

var hit_sfx: AudioStream = preload("res://resources/audio/hit.ogg")
var wing_sfx: AudioStream = preload("res://resources/audio/wing.ogg")

func _ready() -> void:
	animated_sprite_node.animation = "idle"
	animated_sprite_node.play()

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = flap_height
		audio_stream_player_node.stream = wing_sfx
		audio_stream_player_node.play()
		animated_sprite_node.stop()
		animated_sprite_node.animation = "flap"
		animated_sprite_node.play()

	velocity.y += accel_y * delta

	global_rotation_degrees = (velocity.y / max_vel_y) * max_rot

	if velocity.y > max_vel_y:
		velocity.y = max_vel_y

	if position.y > 350:
		position.y = 350
	move_and_slide()

func game_over() -> void:
	audio_stream_player_node.stream = hit_sfx
	audio_stream_player_node.play()
	get_tree().paused = true
