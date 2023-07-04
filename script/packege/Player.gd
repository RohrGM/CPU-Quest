extends KinematicBody2D

var _card: CardModel
var _interactable: Node2D
var _anim: Node2D
var _gui: CanvasLayer
var _card_sprite: Sprite

####### PUBLIC ###########################################################
func set_interactable(interactable: Node2D) -> void:
	_interactable = interactable
	_gui.set_message(_interactable.get_interaction_message())
	
func remove_interactable(interactable: Node2D) -> void:
	_gui.set_message('')
	if _interactable == interactable:
		_interactable = null
	
func take_card(card: CardModel) -> void:
	_anim.change_anim("Take", false)
	_gui.set_message(_interactable.get_interaction_message())
	_set_card(card)
	
func send_card() -> void:
	_start_send_card()
	
func has_card() -> bool:
	if _card == null:
		return false
		
	return true
	
func _has_finished_card() -> bool:
	if _card == null:
		return false
	return _card.is_finish()
	
####### PRIVATE ##########################################################
func _ready() -> void:
	_anim = $Animation
	_gui = $GUI
	_card_sprite = $Animation/Sprite/Card

func _physics_process(_delta: float) -> void:
	var input_vector : Vector2 = $MovimentPlayer.move(_delta, _anim.is_free())	
	_anim.update_anim_tree(input_vector)

func _unhandled_input(event):
	if event.is_action_pressed("interact"):
		if(_interactable != null and _anim.is_free()):
			_interactable.interaction(self)
			
func _set_card(card: CardModel) -> void:
	_card = card
	_gui.set_card(_card)
	_card_sprite.texture.atlas = null if card == null else load(_card.get_path_img())

func _start_send_card() -> void:
	_anim.change_anim("Send", false)
	
func _end_send_card() -> void:
	_interactable.take_card(_card)
	_gui.set_message(_interactable.get_interaction_message())
	_set_card(null)
			
####### SIGNALS ##########################################################
