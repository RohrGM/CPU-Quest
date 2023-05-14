extends CanvasLayer

var _card_texture: TextureRect
var _id_label: Label
var _init_label: Label
var _service_label: Label
var _priority_label: Label
var _row_label: Label
var _message_label: Label

func _ready() -> void:
	_card_texture = $Control/Book/Card
	_id_label = $Control/Book/Id
	_init_label = $Control/Book/Init
	_service_label = $Control/Book/Service
	_priority_label = $Control/Book/Priority
	_row_label = $Control/Book/Row
	_message_label = $Control/Message

func set_card(card: CardModel) -> void:
	_card_texture.texture = null if card == null else load(card.get_path_img())
	_id_label.text = '' if card == null else 'Entidade: %02d' % card.get_id()
	_init_label.text = '' if card == null else 'Tempo de Chegada: %02d' % card.get_init()
	_service_label.text = '' if card == null else 'Atendimento: %02d/%02d' % [card.get_run(), card.get_service()]
	_priority_label.text = '' if card == null else 'Prioridade: %d' % card.get_priority()
	_row_label.text = '' if card == null else 'Tempo de Fila: %02d' % card.get_row()
	
func set_message(message: String) -> void:
	_message_label.text = message
