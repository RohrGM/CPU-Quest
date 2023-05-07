extends Node

func set_sprite(frame: int) -> void:
	frame += 95
	print('aqui')
	$Sprite.set_frame(frame)
