extends IPlayer

var _card: CardModel
var _interactable: IInteractable
var _anim: Node2D

func _ready():
	_anim = $Animation

func _physics_process(_delta: float) -> void:
	var input_vector : Vector2 = $MovimentPlayer.move(_delta, _anim.is_free())
	
	_anim.update_anim_tree(input_vector)

func _unhandled_input(event):
	if event.is_action_pressed("interact"):
		if(_interactable != null):
			_interactable.interaction(self)
		
func set_interactable(interactable: IInteractable) -> void:
	_interactable = interactable
	
func remove_interactable(interactable: IInteractable) -> void:
	if _interactable == interactable:
		_interactable = null
	
func take_card(card: CardModel) -> void:
	_card = card
	_anim.change_anim("Take", false)
	$GUI.set_card(_card)
	
func has_card() -> bool:
	if _card == null:
		return false
	return true
