extends StaticBody2D

var _card: CardModel
var _message: String

####### PUBLIC ###########################################################
func interaction(player: KinematicBody2D) -> void:
	if _has_card():
		_send_card(player)
		return
	player.send_card()
		
func take_card(card: CardModel) -> void:
	_card = card
	$Card.visible = true
	$Card.set_sprite(card.get_path_img())
	_message = "Pegar Processo"
		
func get_interaction_message() -> String:
	return _message

####### PRIVATE ##########################################################
func _ready():
	_card = CardModel.new(5, 1)
	$Card.set_sprite(_card.get_path_img())
	_message = ''
	
func _send_card(player: KinematicBody2D) -> void:
	$Card.visible = false
	_message = "Largar Processo"
	player.take_card(_card)
	_card = null
	
func _has_card() -> bool:
	if _card == null:
		return false
	return true
	
####### SIGNALS ##########################################################
func _on_Area2D_body_entered(_body) -> void:
	if _body.is_in_group("Player"):
		if _body.has_card() and _has_card():
			print("aqui")
			_message = ''
			return
			
		_message = "Largar Processo" if _body.has_card() and not _has_card() else "Pegar Processo"
		$Selected.visible = true
		_body.set_interactable(self)

func _on_Area2D_body_exited(_body) -> void:
	if _body.is_in_group("Player"):
		$Selected.visible = false
		_body.remove_interactable(self)
		
	
