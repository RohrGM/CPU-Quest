extends Node2D

var _pods: Array
var _rng: RandomNumberGenerator
var _total_cards: int
var _total_finished: int
var _time: int
var _controller: Node2D
var _processing: bool
var _timer: Timer
var _cards_scene: Array
var _validator: Validator
var _result_scene: String
export var _max_cards: int = 10

####### PUBLIC ###########################################################
func set_processing(status: bool) -> void:
	_processing = status
	if _processing:
		_timer.start()
	
func remove_card(card: CardModel) -> void:
	_cards_scene.erase(card)
	_total_finished += 1
	_check_cards()
	_update_Stage()
	if _total_finished == _max_cards:
		_end_simulation()
	
func get_validator() -> Validator:
	return _validator
	
####### PRIVATE ##########################################################
func _ready() -> void:
	_pods = get_tree().get_nodes_in_group("Pod")
	_controller = find_node("Controller")
	_rng = RandomNumberGenerator.new()
	_validator = FIFO.new()
	_timer = $Timer
	_total_cards = 0
	_total_finished = 0
	_time = 0
	_processing = false
	_cards_scene = []
	_result_scene = "res://scene/Result.tscn"
	_check_cards()
	
func _check_cards() -> void:
	if _cards_scene.size() == 0:
		if _total_cards == _max_cards:
			return
		_timer.start()
		
func _spaw_cards() -> void:
	for pod in _pods :
		if not pod.has_card() and _rng.randi_range(1, 7) == 1 and _total_cards < _max_cards:
			var card: CardModel = _generate_card()
			_validator.add_card(card)
			_cards_scene.append(card)
			pod.take_card(card)
			return
	
func _generate_card() -> CardModel:
	_total_cards += 1
	var priority = 1 if Global.mode == "FIFO" else _rng.randi_range(1, 3)
	return CardModel.new(_time, priority, _total_cards, _rng.randi_range(3, 7))

func _update_Stage() -> void:
	_controller.set_stage("%02d/%02d" % [_total_finished, _max_cards])
	
	
func _end_simulation() -> void:
	Global.total_time = _time
	Global.errors = _validator.get_errors()
	Global.score = _validator.get_score()
	Global.total_cards = _max_cards
	Global.logs = _validator.get_logs()
	
	get_tree().change_scene(_result_scene)
		
####### SIGNALS ##########################################################
func _on_Timer_timeout() -> void:
	_time += 1
	_controller.set_timer(_time)
	_spaw_cards()
	_check_cards()
