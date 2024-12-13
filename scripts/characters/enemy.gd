class_name Enemy
extends Character

@export var base_atk:int
@export var atk_buff_chance := 0.0
@export var block_chance := 0.0
@export var heal_chance := 0.0
@export var shrink_hand_chance := 0.0

var shrink_hand_eff:EffectFactory
var normal_difficulty := true
var _animation_player:AnimationPlayer

func _ready() -> void:
	signals.battle_scene_loaded.connect(_on_battle_scene_loaded)
	signals.enemy_hit.connect(_on_enemy_hit)
	signals.enemy_recover_hp.connect(_on_enemy_recover_hp)
	health_bar.init_health(max_health)
	shrink_hand_eff = ShrinkHandEffectFactory.new()
	
	super()


func actions():
	await get_tree().create_timer(0.1).timeout
	var dmg_taken := max_health - curr_health
	var random_factor := 0.0
	var damage := 0
	
	if normal_difficulty:
		random_factor = randf_range(0.05, 0.3)
		damage = randi_range(3, max(3, int(dmg_taken * random_factor)))
	else:
		random_factor = randf_range(0.1, 0.3)
		damage = max(3, int(dmg_taken * random_factor))
	
	# Now get a probability and use to possibly do an effect
	random_factor = randf()
	
	if random_factor < atk_buff_chance:
		effect_text.update_text("x2 attack next turn")
		atk_buff_eff.generate(self, 1, 2.0)
	elif random_factor < atk_buff_chance + block_chance:
		player.effect_text.reset_and_update_text("Block player atk")
		block_eff.generate(player, 1, 0.0)
	elif random_factor < atk_buff_chance + block_chance + heal_chance:
		effect_text.update_text("Heal 15%")
		_animation_player.play("heal")
		heal_eff.generate(self, 0, 0.15)
	elif random_factor < atk_buff_chance + block_chance + heal_chance + shrink_hand_chance:
		player.effect_text.reset_and_update_text("Reduce hand size")
		shrink_hand_eff.generate(player, 1, 1)
	
	_animation_player.play("attack")
	await get_tree().create_timer(0.3).timeout
	signals.player_hit.emit(damage * atk_multiplier)
	_play($Audio/Attack)
	await get_tree().create_timer(1.0).timeout
	
	if effect_text.text.contains("x2 attack next turn"):
		effect_text.reset_and_update_text("x2 attack this turn")
	elif effect_text.text.contains("x2 attack next turn"):
		effect_text.reset_text()
	else:
		effect_text.reset_text()
	
	_finish_turn()


func _finish_turn() -> void:
	super()


func _on_battle_scene_loaded(_match_label:Label, _synergy_ui:Node2D, enemy_anim_player:AnimationPlayer) -> void:
	_animation_player = enemy_anim_player


func _on_enemy_hit(dmg:int) -> void:
	_animation_player.play("hit")
	# Internally update health
	curr_health = clampi(curr_health - dmg, 0, max_health)
	await health_bar.update_health(curr_health)


func _on_enemy_recover_hp(amount:float) -> void:
	if 0.0 < amount and amount < 1.0:
		# Increase by integer amount, not float
		curr_health = clampi(int(curr_health * (1.0 + amount)), curr_health, max_health)
		await health_bar.update_health(curr_health)


func _play(player:AudioStreamPlayer) -> void:
	if !player.playing:
		player.play()
