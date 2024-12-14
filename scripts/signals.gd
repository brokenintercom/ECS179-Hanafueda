class_name Signals
extends Node

signal switch_scene(next_scene:String)
signal battle_scene_loaded(match_label:Label, synergy_ui:Node2D, enemy_anim_player:AnimationPlayer)
signal switch_battle_phase
signal player_hit(dmg:float)
signal enemy_hit(dmg:float)
signal player_recover_hp(amount:float)
signal enemy_recover_hp(amount:float)
signal next_page
signal previous_page
signal show_guide
signal display(new_display:int)
signal on_transition_finished
