extends CanvasLayer

func set_card(card: CardModel) -> void:
	$Control/Card.texture = null if card == null else load(card.get_path_img())
	
func set_message(message: String) -> void:
	print('message: ', message)
	$Control/Message.text = message
