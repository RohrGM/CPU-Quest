extends IInteractable

var pod: PodModel
var card: CardModel

func _ready():
	pod = PodModel.new()
	card = CardModel.new(5, 1)
	
	$Card.set_sprite(card.get_path_img())
	
func interaction(player: IPlayer) -> void:
	player.take_card(card)
	$Card.visible = false

func _on_Area2D_body_entered(_body):
	if _body.is_in_group("Player") and not _body.has_card():
		$Selected.visible = true
		_body.set_interactable(self)

func _on_Area2D_body_exited(_body):
	if _body.is_in_group("Player"):
		$Selected.visible = false
		_body.remove_interactable(self)
	
