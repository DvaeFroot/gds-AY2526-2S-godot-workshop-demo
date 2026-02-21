class_name Mainmenu
extends Node2D

@onready var game_manager_node: Game

func _ready() -> void:
	game_manager_node = get_tree().get_nodes_in_group("game_manager")[-1]

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		game_manager_node.switch_scene("res://scenes/play.tscn")
			
