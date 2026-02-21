class_name Pipe
extends Node2D

@onready var audio_stream_player_node: AudioStreamPlayer = $AudioStreamPlayer
@onready var point_sfx: AudioStream = preload("res://resources/audio/point.ogg")

@export var move_speed: float = 90

var score_counter_node: ScoreCounter

func _ready() -> void:
	score_counter_node = get_tree().get_nodes_in_group("score_counter")[-1]
	global_position.y = randi_range(50, 300)

func _physics_process(delta: float) -> void:
	global_position.x -= move_speed * delta

	if global_position.x < -50:
		global_position.x = 300
		global_position.y = randi_range(50, 280)

func _on_area_2d_area_entered(area: Area2D) -> void:
	var player: Player = area.get_parent()	
	player.game_over()

func _on_score_box_area_entered(_area: Area2D) -> void:
	score_counter_node.increment_score()
	audio_stream_player_node.stream = point_sfx
	audio_stream_player_node.play()
