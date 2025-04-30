extends Node

signal animal_died
signal attempt_made
signal cup_destroyed(remaining_cups: int)

func emit_on_animal_died() -> void:
	animal_died.emit()
	
func emit_on_attempt_made() -> void:
	attempt_made.emit()

func emit_cup_destroyed(remaining_cups: int) -> void:
	cup_destroyed.emit(remaining_cups)
