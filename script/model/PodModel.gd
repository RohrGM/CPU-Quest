extends Node

class_name PodModel

var _card: CardModel

func set_card(card: CardModel) -> void:
	_card = card
	
func get_card() -> CardModel:
	return _card
