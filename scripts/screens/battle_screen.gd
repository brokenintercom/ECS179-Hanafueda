class_name BattleScreen
extends Node

enum PhaseType {
	PLAYER,
	ENEMY,
}

var _curr_phase := PhaseType.PLAYER
@onready var match_label := $Match
@onready var synergy_ui := %Synergy
@onready var enemy_anim_player := $Boss/AnimationPlayer
@onready var _play_btn := $Control/PlayCardsButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	signals.battle_scene_loaded.emit(match_label, synergy_ui, enemy_anim_player)
	signals.switch_battle_phase.connect(_on_switch_battle_phase)
	tutorial.visible = true
	player.hand.visible = true
	player.did_win = false
	player.health_bar.visible = true
	enemy.health_bar.visible = true
	
	# Shuffle the player's deck at the beginning of every battle
	#player.deck.shuffle()
	_player_phase()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if len(player.selected_cards) == 0:
		_play_btn.disabled = true
	else:
		_play_btn.disabled = false


func _player_phase() -> void:
	if _lose_condition():
		player.did_win = false
		_show_results()
	else:
		player.actions()


func _enemy_phase() -> void:
	if _win_condition():
		player.did_win = true
		_show_results()
	else:
		enemy.actions()


func _win_condition() -> bool:
	return enemy.curr_health <= 0


func _lose_condition() -> bool:
	return player.curr_health <= 0 or (player.hand.is_empty() and player.deck.is_empty())


func _show_results() -> void:
	_reset_battle()
	
	signals.switch_scene.emit("results_screen")


func _reset_battle() -> void:
	player.reset()
	enemy.reset()
	deck_view.reset()


func _on_help_button_pressed() -> void:
	signals.show_guide.emit()


func _on_play_cards_button_pressed() -> void:
	_play_btn.disabled = true
	player.play_cards()


func _on_title_screen_button_pressed() -> void:
	_reset_battle()
	signals.switch_scene.emit("title_screen")


func _on_switch_battle_phase() -> void:
	# Player turn just ended
	if _curr_phase == PhaseType.PLAYER: # swtich to ENEMY turn
		_curr_phase = PhaseType.ENEMY
		_play_btn.disabled = true
		_enemy_phase()
	else:  # Enemy turn just ended, so switch to PLAYER turn
		_curr_phase = PhaseType.PLAYER
		_play_btn.disabled = false
		_player_phase()


func _on_deck_pressed() -> void:
	deck_view.visible = true
