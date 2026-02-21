class_name Game
extends Node2D

@onready var current_scene_node: Node2D = $CurrentScene

var play_scene: String = "res://scenes/play.tscn"
var mainmenu_scene: String = "res://scenes/mainmenu.tscn"

func _ready() -> void:
	switch_scene(mainmenu_scene)

func switch_scene(scene_path: String) -> void:
	var has_children = current_scene_node.get_children().size() != 0
	if has_children:
		var current_scene = current_scene_node.get_child(0)
		current_scene.queue_free()

	var new_scene: PackedScene = load(scene_path)
	var new_scene_instance = new_scene.instantiate()
	current_scene_node.add_child(new_scene_instance)

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if get_tree().paused == true:
			switch_scene(play_scene)
			get_tree().paused = false
		
