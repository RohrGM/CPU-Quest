extends Node

class_name CardModel

var _init_time: int
var _row_time: int
var _service_time: int
var _end_time: int
var _priority

func _init(init_time: int, priority: int):
	_init_time = init_time
	_priority = priority

func get_priority() -> int:
	return _priority
