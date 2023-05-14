extends YSort

var _card: CardModel
var _current_message: String
var _take_message: String = "Pegar"
var _drop_message: String = "Colocar"

var _panel_sprite: Sprite

####### PUBLIC ###########################################################
func interaction(player: KinematicBody2D) -> void:
	if _has_card():
		_send_card(player)
		return
	player.send_card()

func take_card(card: CardModel) -> void:
	_card = card
	_current_message = _take_message

func get_interaction_message() -> String:
	return _current_message

####### PRIVATE ##########################################################
func _ready():
	_panel_sprite = $Panel/Sprite

func _send_card(player: KinematicBody2D) -> void:
	_current_message = _drop_message
	player.take_card(_card)
	_card = null

func _has_card() -> bool:
	if _card == null:
		return false
	return true

####### SIGNALS ##########################################################
func _on_Area2D_body_entered(_body: Node) -> void:
	if _body.is_in_group("Player"):
		if not _body.has_card() and not _has_card():
			_current_message = ''
			return

		_current_message = _drop_message if _body.has_card() and not _has_card() else _take_message
		_body.set_interactable(self)
		_panel_sprite.material.set("shader_param/line_thickness", 1)

func _on_Area2D_body_exited(_body: Node) -> void:
	if _body.is_in_group("Player"):
		_body.remove_interactable(self)
		_panel_sprite.material.set("shader_param/line_thickness", 0)
