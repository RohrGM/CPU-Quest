extends Control

var game_scene: String

func _ready() -> void:
	game_scene = "res://scene/Game.tscn"

func _on_Fifo_pressed() -> void:
	Global.mode = "FIFO"
	get_tree().change_scene(game_scene)
