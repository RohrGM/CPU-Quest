extends Control

var game_scene: String


func _ready():
	game_scene = "res://scene/Game.tscn"

func _on_Fifo_pressed():
	get_tree().change_scene(game_scene)
