extends Control

var _attempts = 0
@onready var attempts_label: Label = $MarginContainer/VBoxContainer/AttemptsLabel
@onready var v_box_container_2: VBoxContainer = $MarginContainer/VBoxContainer2
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var level_label: Label = $MarginContainer/VBoxContainer/LevelLabel
@onready var level_complete_label: Label = $MarginContainer/VBoxContainer2/LevelCompleteLabel

func _ready() -> void:
	level_label.text = "Level %s" % ScoreManager.level_selected
	update_attempts_label()

func _enter_tree() -> void:
	SignalHub.attempt_made.connect(on_attempt_made)
	SignalHub.cup_destroyed.connect(on_cup_destroyed)

func on_attempt_made() -> void:
	_attempts += 1
	update_attempts_label()

func update_attempts_label() -> void:
	attempts_label.text = "Attempts %s" % _attempts

func on_cup_destroyed(remaining_cups: int) -> void:
	if remaining_cups == 0:
		ScoreManager.set_score_for_level(
			ScoreManager.level_selected,
			_attempts
		)
		v_box_container_2.show()
		audio_stream_player.play()
