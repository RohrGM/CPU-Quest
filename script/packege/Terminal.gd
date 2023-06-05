extends Node2D


var _card: CardModel
var _card_texture: TextureRect
var _id_label: Label
var _init_label: Label
var _service_label: Label
var _priority_label: Label
var _message_label: Label
var _timer_label: Label
var _status_label: Label

func _ready() -> void:
	_id_label = $Box1/Id
	_init_label = $Box1/Init
	_service_label = $Box1/Service
	_priority_label = $Box1/Priority
	_card_texture = $Box1/Card
	_timer_label = $TimerSprite/Label
	_status_label = $Box1/Status
	
	set_card(null, 0)

func set_card(card: CardModel, time: int) -> void:
	_card_texture.texture = null if card == null else load(card.get_path_img())
	_id_label.text = 'Entidade: --' if card == null else 'Entidade: %02d' % card.get_id()
	_init_label.text = '--' if card == null else '%02d' % time
	_service_label.text = '--/--' if card == null else '%02d/%02d' % [card.get_run(), card.get_service()]
	_priority_label.text = 'Prioridade: --' if card == null else 'Prioridade: %d' % card.get_priority()
	_status_label.text = "Aguardando Processo" if card == null else "Executando"
	
func update_card(card: CardModel) -> void:
	_service_label.text = '--/--' if card == null else '%02d/%02d' % [card.get_run(), card.get_service()]
	_status_label.text = "Finalizado" if card.is_finish() else "Executando"

func set_timer(time: int) -> void:
	_timer_label.text = "Tempo: %02d" % time
