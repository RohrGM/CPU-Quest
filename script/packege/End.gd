extends StaticBody2D

var _drop_message: String = "Finalizar"
var _card: CardModel
var _current_message: String

func _ready():
	pass # Replace with function body.

####### PUBLIC ###########################################################
func interaction(player: KinematicBody2D) -> void:
	player.send_card()

func take_card(card: CardModel) -> void:
	_card = card

func get_interaction_message() -> String:
	return _current_message

####### SIGNALS ##########################################################
func _on_Area2D_body_entered(_body: Node) -> void:
	if _body.is_in_group("Player"):
		if not _body._has_finished_card():
			_current_message = ''
			return

		_current_message = _drop_message
		_body.set_interactable(self)
		$Base.material.set("shader_param/line_thickness", 1)

func _on_Area2D_body_exited(_body: Node) -> void:
	if _body.is_in_group("Player"):
		_body.remove_interactable(self)
		$Base.material.set("shader_param/line_thickness", 0)

