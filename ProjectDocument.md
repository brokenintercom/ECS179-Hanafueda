# Hanafeuda

## Summary

**A paragraph-length pitch for your game.**

## Project Resources

[Web-playable version of your game.](https://itch.io/)  
[Trailer](https://youtube.com)  
[Press Kit](https://dopresskit.com/)  
[Proposal: make your own copy of the linked doc.](https://docs.google.com/document/d/1qwWCpMwKJGOLQ-rRJt8G8zisCa2XHFhv6zSWars0eWM/edit?usp=sharing)  

## Gameplay Explanation

insert damage engine calculation stuff, how we determined it...
clicking on cards, the different buttons...

**In this section, explain how the game should be played. Treat this as a manual within a game. Explaining the button mappings and the most optimal gameplay strategy is encouraged.**


**Add it here if you did work that should be factored into your grade but does not fit easily into the proscribed roles! Please include links to resources and descriptions of game-related material that does not fit into roles here.**

links to resources and whatnot...

# External Code, Ideas, and Structure

If your project contains code that: 1) your team did not write, and 2) does not fit cleanly into a role, please document it in this section. Please include the author of the code, where to find the code, and note which scripts, folders, or other files that comprise the external contribution. Additionally, include the license for the external code that permits you to use it. You do not need to include the license for code provided by the instruction team.

If you used tutorials or other intellectual guidance to create aspects of your project, include reference to that information as well.

@Jamie: https://www.youtube.com/watch?v=Pa0P1lUoC-M&list=PL6SABXRSlpH8CD71L7zye311cp9R4JazJ&index=3 (add more info)

# Main Roles

Your goal is to relate the work of your role and sub-role in terms of the content of the course. Please look at the role sections below for specific instructions for each role.

Below is a template for you to highlight items of your work. These provide the evidence needed for your work to be evaluated. Try to have at least four such descriptions. They will be assessed on the quality of the underlying system and how they are linked to course content. 

*Short Description* - Long description of your work item that includes how it is relevant to topics discussed in class. [link to evidence in your repository](https://github.com/dr-jam/ECS189L/edit/project-description/ProjectDocumentTemplate.md)

Here is an example:  
*Procedural Terrain* - The game's background consists of procedurally generated terrain produced with Perlin noise. The game can modify this terrain at run-time via a call to its script methods. The intent is to allow the player to modify the terrain. This system is based on the component design pattern and the procedural content generation portions of the course. [The PCG terrain generation script](https://github.com/dr-jam/CameraControlExercise/blob/513b927e87fc686fe627bf7d4ff6ff841cf34e9f/Obscura/Assets/Scripts/TerrainGenerator.cs#L6).

You should replay any **bold text** with your relevant information. Liberally use the template when necessary and appropriate.

## Producer (Tim Dela Cruz)

**Describe the steps you took in your role as producer. Typical items include group scheduling mechanisms, links to meeting notes, descriptions of team logistics problems with their resolution, project organization tools (e.g., timelines, dependency/task tracking, Gantt charts, etc.), and repository management methodology.**

## User Interface and Input (Jamie Hsi)

**Describe your user interface and how it relates to gameplay. This can be done via the template.**
**Describe the default input configuration.**

**Add an entry for each platform or input style your project supports.**

## Enemy Effects/AI (Chris Wang)

**Describe the basics of movement and physics in your game. Is it the standard physics model? What did you change or modify? Did you make your movement scripts that do not use the physics system?**

## Animation and Visuals (Yujin Cho)

**List your assets, including their sources and licenses.**

**Describe how your work intersects with game feel, graphic design, and world-building. Include your visual style guide if one exists.**

## Game Logic (Yoobin Jin)
The game has 3 main states: the title screen, battle screen, and results screen. Each "screen" was its own scene that is "loaded" by a [scene manager](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/screens/scene_manager.gd) by deleting the node for the previous screen and adding the next screen as a child. Having a scene manager was inspired by how we went through the different mini games from discussion.

My goal was to try and incorporate ideas of the component pattern, breaking down the code into components, use inheritance, and try to generalize when possible.
* [player.gd](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/characters/player.gd) and [enemy.gd](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/characters/enemy.gd) inherit from [character.gd](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/characters/character.gd), which defines some common attributes and functions for both characters. For example, they both have `max_health`, `curr_health`, and `_finish_turn()` which does some clean up before switching phases (player to enemy and vice versa).
    * Unfortunately, I was unable to generalize some of the signals for the characters. For example, I have separate `player_hit` and `enemy_hit` signals even though they behave similarly to ensure that both characters are not listening to the same signal (causing the code to run twice).
    * Note: the player and enemy are both global since many different game states/screens and other objects will need to access or modify these characters.
* The player has a `Hand` containing a grid container of texture buttons representing the cards. The texture buttons were convenient because I thought it would be easiest if the cards were buttons themselves, making interactions with the cards easier.
    * I only made use of the `texture_normal` attribute and not the other textures because we already have many sprites (48 sprites for just the cards!), so making slightly modified sprites for when the button is clicked, disabled, etc. didn't seem like a good idea. Instead, these attributes are modified through the state machine (discussed later)


### Battle Screen
The [battle screen](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/screens/battle_screen.gd) starts off by ensuring the player and enemy nodes (which are global) are visible since their `visible` attributes should have been disabled earlier. The battle screen also needs to listen for a `switch_battle_phase` signal to know when to update `_curr_phase` and call either `_player_phase()` or `_enemy_phase()` as needed. These functions check for the win/lose condition. If the player hasn't definitively won or lost, then the player (or enemy) can take their action. For example, the player's turn starts by drawing cards.


The battle screen is connected to the signal emitted when the "play cards" button is pressed. The battle screen passes the signal onto the player by calling the player's `play_cards()` function. This function calculates the damage based on the player's selected cards, deals damage to the enemy via the `enemy_hit` signal, applies any synergy if the player's selected cards had a synergy, and cleans up (discussed further in the Player section)


### Player
#### Player hand/cards and state machine
Based on Jamie's card state machine and card state skeleton code, I determined what states we would need, as well as the transitions between states as shown in the diagram below:
![IMG_4195](https://github.com/user-attachments/assets/bf9fad88-c596-44ee-89b9-0dea23fe0ba6)

Cards can be in one of the following states:
1) **Empty:** the card button has no `texture_normal` assigned, so the button appears to be empty while still taking up space in the grid container.
2) **Enabled:** the card button is fully colored in and clickable, but has not been selected.
3) **Selected:** the card button has been selected, as indicated by the blue-green outline around the card. For simplicity, this was implemented by just having a color rectangle behind the button and setting its `visible` attribute..
4) **Disabled:** the card button is grayed out and cannot be clicked on/interacted with. To achieve the grayed out effect, I adjusted the button's `modulate` attribute.

Initially, the player's hand (more specifically, the `Hand`'s grid container) contains 8 texture buttons. The buttons don't have a `texture_normal` yet. When the player draws cards, the cards/buttons get their `texture_normal` set, giving the appearance that the card has appeared in the hand (even though the card button was technically always there). 

When a selected card is played, the button's `texture_normal` is set back to `null`, appearing as an "empty spot". Because the card button is not actually removed, the grid container dimensions are not resized. Overall, I reasoned that updating the button nodes in-place would be simpler and faster than constantly adding and removing card button nodes.

[card.gd](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/card/card.gd) has many short, digestible functions. Many of these functions are simply getters to make other code more readable. One of the most important functions is `update_card()`, which updates the important attributes of the card. This includes the attributes that are part of the [CardSpec](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/card/card_spec.gd) object.

The `CardSpec` object is like the `ShieldSpec` or `ProjectileSpec` objects from exercise 3. It contains the main attributes of a card, which are its `Month`, `Type`, `Synergy`, and `Texture`. This `CardSpec` object is used to update the card buttons.  `card.gd`'s `update_card()` updates the card button based on a provided `CardSpec`, while the [CardSpecFactory](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/card/card_spec_factory.gd)'s `card_to_spec()` creates a `CardSpec` based on the card, based on exercise 3's factory pattern. This factory also has a pre-made `empty_card_spec` to easily update a card button to become "empty".


#### Deck
[card_pile.gd](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/card/card_pile.gd) is simply an array of `CardSpecs`. The card pile is extended by [deck.gd](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/card/deck.gd), which is initialized using [deck.csv](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/assets/deck_csv/deck.csv).

When `draw_card()` is called, the card at the top of the deck is drawn since an actual deck is drawn as if it's a stack (popping from the end of the array is more efficient too, as opposed to the beginning). The function returns a `CardSpec`, and in the player's `draw_cards()`, the `CardSpec` is used to update the current card button's attributes.


#### Matching logic
In [hand.gd](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/card/hand.gd), its various functions are called every time a card is selected or deselected. First, we determine what category we're matching by (month or type). There is also an edge case where both month and type are viable categories, though the card damage will be calculated using the type by default in this case.

Then, we iterate through all the card buttons and determine if they have the same month (if matching by month, and similarly with type) as the selected cards' month. If they match, the card remains in the enabled state. Otherwise, the card transitions to disabled.

#### Damage Engine
The [Damage Engine](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/damage_engine.gd) uses a similar approach as the one in exercise 3. Its functions are static, and enums are used to index into a grid/array to determine the damage. 

This strategy also allows us to easily modify how many points each type does, which was better than our initial implementation where the type enum's internal integer values were hard-coded in the enum definition instead (which means the values cannot be dynamically changed anymore). This aspect of easily modifying the point value of each type was to help make it easier for a future possible addition of upgrading the player's deck so that each card does more damage than before.


#### Misc.
The player's finish_turn() function moves all selected cards into the discard pile. More specifically, each card button's attributes are encapsulated into a `CardSpec` and put into the discard pile, similar to how the deck is an array of `CardSpec` objects. Since the card is considered to be in the discard pile, the card button transitions to the "empty" state, and the number of hands in the player's hand decreases. Unselected cards transition to the enabled state if they are not already.

* 

**Document the game states and game data you managed and the design patterns you used to complete your task.**

# Sub-Roles

## Audio (Chris Wang)

**List your assets, including their sources and licenses.**

**Describe the implementation of your audio system.**

**Document the sound style.** 

## Gameplay Testing (Yoobin Jin)

**Add a link to the full results of your gameplay tests.**

**Summarize the key findings from your gameplay tests.**

## Narrative Design (Yujin Cho)

**Document how the narrative is present in the game via assets, gameplay systems, and gameplay.** 

## Press Kit and Trailer (Tim Dela Cruz)

**Include links to your presskit materials and trailer.**

**Describe how you showcased your work. How did you choose what to show in the trailer? Why did you choose your screenshots?**

## Game Feel and Polish (Jamie Hsi)

**Document what you added to and how you tweaked your game to improve its game feel.**