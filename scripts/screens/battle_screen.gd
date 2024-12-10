class_name BattleScreen
extends Node

enum PhaseType {
	PLAYER,
	ENEMY,
}

@export var _num_turns_left:int

@onready var _play_btn := $Control/PlayCardsButton

var _curr_phase := PhaseType.PLAYER
var _drew_cards := false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	signals.switch_battle_phase.connect(_on_switch_battle_phase)
	tutorial.visible = true
	player.hand.visible = true
	player.did_win = false
	player.health_bar.visible = true
	enemy.health_bar.visible = true
	
	# Shuffle the player's deck at the beginning of every battle
	player.deck.shuffle()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if len(player.selected_cards) == 0:
		_play_btn.disabled = true
	else:
		_play_btn.disabled = false
	
	# TODO technically it's repeatedly calling either _enemy_phase or _player_phase unnecessarily
	if _curr_phase == PhaseType.ENEMY:
		_enemy_phase()
	elif _curr_phase == PhaseType.PLAYER:
		_player_phase()


func _on_switch_battle_phase() -> void:
	# Player turn just ended
	if _curr_phase == PhaseType.PLAYER:
		_curr_phase = PhaseType.ENEMY
		# TODO @Jamie: Disable player input if needed
	else:  # Enemy turn just ended
		# TODO re-enable player input if needed
		_curr_phase = PhaseType.PLAYER
		# TODO Jamie: update UI too
		_num_turns_left -= 1
		_drew_cards = false


# TODO modify later
func _on_title_screen_button_pressed() -> void:
	print("Switching to title screen...")
	
	_reset_battle()
	
	signals.switch_scene.emit("title_screen")

func _on_help_button_pressed() -> void:
	print("Showing guide...")
	signals.show_guide.emit()

func _player_phase() -> void:
	# TODO Jamie: reenable player button input, or probably better to do in battle phase switch signal
	
	# TODO code style 
	if _lose_condition():
		print("player lost")
		player.did_win = false
		_show_results()
	elif not _drew_cards:
		# Draw enough cards such that the player's hand would have max_hand_size cards
		var num_draw:int = player.hand.max_hand_size - player.hand.num_cards
		player.draw_cards(num_draw)
		_drew_cards = true


func _enemy_phase() -> void:
	if _win_condition():
		print("player won")
		player.did_win = true
		_show_results()
	else:
		enemy.enemy_actions()


func _on_play_cards_button_pressed() -> void:
	player.play_cards()


func _show_results() -> void:
	_reset_battle()
	
	signals.switch_scene.emit("results_screen")


func _reset_battle() -> void:
	print("Resetting...")
	player.reset()
	enemy.reset()


func _win_condition() -> bool:
	return enemy.curr_health <= 0


func _lose_condition() -> bool:
	# TODO code style
	return (_num_turns_left == 0 or player.curr_health <= 0
			or (player.hand.is_empty() and player.deck.is_empty()))
