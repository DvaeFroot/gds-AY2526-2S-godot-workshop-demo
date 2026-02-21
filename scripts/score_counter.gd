class_name ScoreCounter
extends Node2D

@onready var ones_node: AnimatedSprite2D = $Ones
@onready var tens_node: AnimatedSprite2D = $Tens
@onready var hundreds_node: AnimatedSprite2D = $Hundreds

var score: int = 0

func _ready() -> void:
	score = 0
	update_score_counter()

func increment_score() -> void:
	score += 1
	update_score_counter()

func update_score_counter() -> void:
	var ones = score % 10
	var tens = (score/10) % 10
	var hundreds = (score/100) % 10

	ones_node.animation = str(ones)
	tens_node.animation = str(tens)
	hundreds_node.animation = str(hundreds)
