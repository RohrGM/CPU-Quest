extends Control

var level_scene: String

func _ready() -> void:
	level_scene = "res://scene/Level.tscn"

func _on_Play_pressed() -> void:
	get_tree().change_scene(level_scene)

func _on_Quit_pressed() -> void:
	get_tree().quit()
