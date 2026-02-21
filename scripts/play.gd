class_name Play
extends Node2D

@onready var bg1_node: Sprite2D = $Background1
@onready var bg2_node: Sprite2D = $Background2

@onready var grd1_node: Sprite2D = $Ground
@onready var grd2_node: Sprite2D = $Ground2

var bg_width: float = 288
var grd_width: float = 336

func _physics_process(delta: float) -> void:
	bg1_node.global_position.x -= 20 * delta
	bg2_node.global_position.x -= 20 * delta
	grd1_node.global_position.x -= 90 * delta
	grd2_node.global_position.x -= 90 * delta
	
	var bg_offset = bg_width/2
	var grd_offset = grd_width/2

	if bg1_node.global_position.x < -bg_width + bg_offset:
		bg1_node.global_position.x += (bg_width * 2) 
	if bg2_node.global_position.x < -bg_width + bg_offset:
		bg2_node.global_position.x += (bg_width * 2)

	if grd1_node.global_position.x < -grd_width + grd_offset:
		grd1_node.global_position.x += (grd_width * 2)
	if grd2_node.global_position.x < -grd_width + grd_offset:
		grd2_node.global_position.x += (grd_width * 2)

func _on_area_2d_area_entered(area: Area2D) -> void:
	var player: Player = area.get_parent()	
	player.game_over()
	

