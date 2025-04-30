extends StaticBody2D

class_name Cup

@onready var animation_player: AnimationPlayer = $AnimationPlayer

static var _num_cups: int = 0

func _unhandled_input(event: InputEvent) -> void:
	if  event.is_action_pressed("exit") and _num_cups > 0:
		_num_cups = 0

func _ready() -> void:
	_num_cups += 1

func die() -> void:
	animation_player.play("vanish")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	_num_cups -= 1
	SignalHub.emit_cup_destroyed(_num_cups)
	queue_free()
