extends Node

class_name CardModel
var _card_path: String
var _init_time: int
var _row_time: int
var _service_time: int
var _end_time: int
var _priority: int
var _run_time: int

func _init(init_time: int, priority: int):
	_init_time = init_time
	_priority = priority
	_run_time = 0
	_service_time = 10
	_card_path = "res://assets/img/card_" + String(_priority) + ".png"

func get_priority() -> int:
	return _priority
	
func get_path_img() -> String:
	return _card_path

