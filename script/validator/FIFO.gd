extends Validator
class_name FIFO

var _points: int
var _errors: int
var _cards: Array
var _log: Array

func _ready() -> void:
	_points = 0
	_errors = 0
	_cards = []
	_log = []

func add_card(card: CardModel) -> void:
	_cards.append(card)
	
func check_action(card: CardModel, action: String) -> void:
	match action:
		"insert":
			if not _is_valid_insert(card):
				_log.append("Processo %02d iniciou atendimento fora de ordem" % card.get_id())
				_errors += 1
			else:
				_points += 10

func _is_valid_insert(card: CardModel) -> bool:
	for c in _cards:
		if c.get_init() < card.get_init() and not c.is_finish():
			return false
	return true;

func get_logs() -> Array:
	return _log

func get_errors() -> int:
	return _errors
	
func get_score() -> int:
	return _points
