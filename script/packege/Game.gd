extends Node2D

var _pods: Array
var _rng: RandomNumberGenerator
var _total_pods: int
var _time: int
var _controller: Node2D
var _processing: bool
var _timer: Timer
var _cards_scene: Array

####### PUBLIC ###########################################################
func set_processing(status: bool) -> void:
	_processing = status
	if _processing:
		_timer.start()
	
func remove_card(card: CardModel) -> void:
	print(card)
	_cards_scene.erase(card)
	_check_cards()
		
####### PRIVATE ##########################################################
func _ready() -> void:
	_pods = get_tree().get_nodes_in_group("Pod")
	_controller = find_node("Controller")
	_rng = RandomNumberGenerator.new()
	_timer = $Timer
	_total_pods = 0
	_time = 0
	_processing = false
	_cards_scene = []
	_check_cards()
	
func _check_cards() -> void:
	if _cards_scene.size() == 0:
		_timer.start()
		
func _spaw_cards() -> void:
	for pod in _pods :
		if not pod.has_card() and _rng.randi_range(1, 7) == 1:
			var card: CardModel = _generate_card()
			_cards_scene.append(card)
			pod.take_card(card)
			return
	
func _generate_card() -> CardModel:
	_total_pods += 1
	return CardModel.new(_time, _rng.randi_range(1, 3), _total_pods, _rng.randi_range(3, 7))
	
####### SIGNALS ##########################################################
func _on_Timer_timeout() -> void:
	_time += 1
	_controller.set_timer(_time)
	_spaw_cards()
	_check_cards()
