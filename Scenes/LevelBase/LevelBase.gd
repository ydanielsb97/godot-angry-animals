extends Node2D

@onready var animal_start: Marker2D = $AnimalStart
const ANIMAL = preload("res://Scenes/Animal/Animal.tscn")
const MAIN = preload("res://Scenes/Main/Main.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		get_tree().change_scene_to_packed(MAIN)

func spawn_animal() -> void:
	var new_animal = ANIMAL.instantiate()
	new_animal.position = animal_start.position
	add_child(new_animal)

func _ready() -> void:
	spawn_animal()

func _enter_tree() -> void:
	SignalHub.animal_died.connect(on_animal_died)

func on_animal_died() -> void:
	spawn_animal()
