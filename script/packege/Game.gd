extends Node2D

var _pods: Array
var _rng: RandomNumberGenerator
var _total_pods: int

####### PUBLIC ###########################################################
####### PRIVATE ##########################################################
func _ready():
	_pods = get_tree().get_nodes_in_group("Pod")
	_rng = RandomNumberGenerator.new()
	_total_pods = 0
	for pod in _pods:
		pod.take_card(_generate_card())

func _generate_card() -> CardModel:
	_total_pods += 1
	return CardModel.new(5, _rng.randi_range(1, 3), _total_pods, _rng.randi_range(1, 10))
####### SIGNALS ##########################################################


