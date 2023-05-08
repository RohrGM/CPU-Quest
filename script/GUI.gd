extends CanvasLayer

func set_card(card: CardModel) -> void:
	$Control/Card.texture = load(card.get_path_img())
