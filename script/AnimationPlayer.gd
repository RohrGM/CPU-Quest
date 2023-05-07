extends Node2D

var _free = true

func _ready() -> void:
	$Sprite/Card.visible = false

func change_anim(anim: String, free: bool) -> void:
	_travel_anim(anim)
	_free = free
	
func is_free() -> bool:
	return _free

func set_free_anim(free: bool) -> void:
	_free = free

func update_anim_tree(input: Vector2) -> void:
	if input != Vector2.ZERO:
		_travel_anim("Run")
		if input.x > 0:
			$Sprite.flip_h = false
		if input.x < 0:
			$Sprite.flip_h = true
	else:
		_travel_anim("Idle")
	
func _travel_anim(anim : String) -> void:
	if _free:
		$AnimationTree.get("parameters/playback").travel(anim)
