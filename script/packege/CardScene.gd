extends Node

func set_sprite(path: String) -> void:
	$Sprite.texture = load(path)
