extends Node2D

var _pods: Array
var _rng: RandomNumberGenerator
var _total_pods: int
var _time: int
var _controller: Node2D
var _processing: bool
var _timer: Timer

####### PUBLIC ###########################################################
func set_processing(status: bool) -> void:
	_processing = status
	if _processing:
		_timer.start()
		
####### PRIVATE ##########################################################
func _ready() -> void:
	_pods = get_tree().get_nodes_in_group("Pod")
	_controller = find_node("Controller")
	_rng = RandomNumberGenerator.new()
	_timer = $Timer
	_total_pods = 0
	_time = 0
	_processing = false
	for pod in _pods:
		pod.take_card(_generate_card())
func _run_cycle() -> void:
	pass
func _generate_card() -> CardModel:
	_total_pods += 1
	return CardModel.new(5, _rng.randi_range(1, 3), _total_pods, _rng.randi_range(1, 10))
####### SIGNALS ##########################################################

func _on_Timer_timeout() -> void:
	_time += 1
	_controller.set_timer(_time)
