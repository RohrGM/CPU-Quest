extends Node

class_name CardModel
var _card_path: String
var _init_time: int
var _row_time: int
var _service_time: int
var _end_time: int
var _priority: int
var _run_time: int
var _id: int

func _init(init_time: int, priority: int, id: int, service_time: int):
	_init_time = init_time
	_priority = priority
	_id = id
	_service_time = service_time
	_card_path = "res://assets/img/card_" + String(_priority) + ".png"
	_run_time = 0

func get_id() -> int:
	return _id

func get_init() -> int:
	return _init_time

func get_service() -> int:
	return _service_time

func get_priority() -> int:
	return _priority

func get_row() -> int:
	return _row_time

func get_run() -> int:
	return _run_time
	
func get_path_img() -> String:
	return _card_path

