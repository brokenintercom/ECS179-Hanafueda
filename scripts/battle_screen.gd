class_name BattleScreen
extends Node

enum PhaseType {
	PLAYER,
	ENEMY,
}

@onready var player := $Player
@onready var enemy := $Enemy
var curr_phase := PhaseType.PLAYER

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	signals.switch_battle_phase.connect(_on_switch_battle_phase)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if curr_phase == PhaseType.ENEMY:
		if enemy.curr_health <= 0:
			print("Switching to win screen...")
			signals.switch_scene.emit("win")
	elif curr_phase == PhaseType.PLAYER:
		# TODO could do "else" but technically for future development I am putting an elif...
		if enemy.num_turns_left == 0 or player.curr_health <= 0:
			print("Switching to lose screen...")
			# TODO need to decrement num turns left in enemy script
			signals.switch_scene.emit("lose")



func _on_switch_battle_phase() -> void:
	if curr_phase == PhaseType.PLAYER:
		curr_phase = PhaseType.ENEMY
		# TODO @Jamie: Disable player input.
	else:
		curr_phase = PhaseType.PLAYER


# TODO modify later
func _on_attack_button_pressed() -> void:
	print("Switching to title screen...")
	signals.switch_scene.emit("title_screen")
