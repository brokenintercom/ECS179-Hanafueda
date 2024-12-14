# Hanafeuda

## Summary

You are in debt to the yakuza, and they want you to pay up, but you simply cannot. The only way the yakuza will change their terms is if you beat them in a game of Hanafeuda in a world where card games have real consequences in reality (much like Yu-Gi-Oh!). Hanafeuda is a turn-based game inspired by the existing game Hanafuda in which you must strategically play cards to deal damage to the opponent before you run out of health or run out of cards, while the yakuza attacks you directly instead. Will your belief in the heart of the cards save you?

## Project Resources

[Web-playable version of your game.](https://brokenintercom.itch.io/hanafueda)  
[Trailer](https://www.youtube.com/watch?v=cYJ0Ghhl8wc)  
[Press Kit](https://github.com/brokenintercom/ECS179-Hanafueda/blob/main/presskit.md)  
[Proposal](https://docs.google.com/document/d/1ReKk03qQ22jLba2pAbRc38L8XjvmlNclLAPEhN9LdHg/edit?usp=sharing)  

## Gameplay Explanation

**In this section, explain how the game should be played. Treat this as a manual within a game. Explaining the button mappings and the most optimal gameplay strategy is encouraged.**
### Controls
For this game, you only need to use the mouse (specifically left button click). You use the mouse to interact with the various buttons. The deck and the cards shown during the battle screen are also clickable buttons. The title screen indicates that the difficulty is by default "normal". To switch to hard mode, click on the yellow arrow to the right of "normal", and the text saying "normal" will turn into "hard". To go back to normal mode, click on the yellow arrow to the left of "hard".

The difficulty affects how much damage the enemy will deal to you. This will especially make a difference towards the end of the battle.

### Card matching
In this game, you must match cards either by Month or Type. Within a month, you match by January cards, February cards, ..., OR December cards. Within types, you can match by Normal cards, Ribbon cards, Animal cards, OR Bright cards.  There are 4 cards for each month

All 4 cards within a month share some similar background or characteristic (with a few exceptions) with each other. Normal cards have a gray border and lack a ribbon, animal, or bright symbol.

Ribbon cards have a red border and a ribbon on them. The ribbon can look either blue, red, or red with some golden text.

Animal cards have a red border with golden corners and an animal on them.

Bright cards have a red border with golden corners and a special symbol (a red circle with writing on it, located on one of the corners of the cards). The main subject on the Bright card varies. These are also the rarest cards in the deck, as there are only 5 Brights.

Hovering over a card will make a text box appear indicating the card's month and type as a reminder. You can also view which cards are in which month/type by clicking the **?** button on the left or by clicking on the deck (also on the left).

### Damage calculation
**Normal:**
* Base dmg: 1
* Bonus dmg (type matching only): play more than 3 matching cards to get +1 for each extra card (e.g., if you play 5 matching cards, you get +2 bonus dmg)

**Ribbon:**
* Base dmg: 2
* Bonus dmg (type matching only): play more than 2 matching cards to get +1 for each extra card

**Animal:**
* Base dmg: 3
* Bonus dmg (type matching only): play more than 2 matching cards to get +1 for each extra card

**Bright:**
* Base dmg: 5
* Bonus dmg (type matching only): play more than 1 matching card to get +1 for each extra card. Furthermore, your bonus damage will be doubled (e.g., if you play 3 matching cards, you get (1 + 1) * 2 bonus damage)

If you select cards with the same *type*, you deal some extra bonus damage depending on how many cards you matched together, as indicated above.

If you select cards with the same *month*, then for 
*extra* matching card, you deal a bonus +3 damage. For example, playing three cards will give +6 bonus damage. If you use all four cards from the same month, then your base damage is doubled as well!

If your selected cards technically match by both month and type, it will be considered a *type* matching.

You can see a preview of the total damage you'll deal to the enemy by looking at the enemy's health bar at the top left of the screen.

### Synergies
There are 3 synergies in the game. Each synergy requires a specific combination of exactly 3 cards. If you successfully play just those 3 cards, the Synergy text box on the left will be updated.

### Selecting a card
Clicking on a card that is colored in (not grayed out) will select it, giving the card a blue outline. The remaining cards will automatically be grayed out if they can't match the selected card(s) in any way. If they *can* possibly be matched, then they will remain colored. The bottom right of the screen will also tell you whether your selected cards will be considered as matching by Month, or by Type. Note that you can select as many (non-grayed-out) cards as you'd like, but consider saving certain cards for future plays.

Clicking on the deck shows you all 48 cards. Grayed out cards have already been played. By looking at this deck view, you can see what cards are left and try to plan some of your future plays.

### Playing cards and enemy action
Once you've selected the cards you want to play, click the Play button on the left. Playing your cards will deal damage to the enemy, and then it will automatically be the enemy's turn. The enemy will attack you directly. The more damage the enemy has taken, the more damage the enemy may deal to you out of desperation. The enemy may unleash its own effects on itself (buff) or you (debuff). Pay close attention to the Effect text boxes on the left!

You lose if you run out of cards to play or if you run out of health. You win when the enemy runs out of health.

### Strategies
At the beginning of the game, playing as many cards (by type) at once is the easiest. If you happen to have all four cards from a month, this should be prioritized, but it's unlikely you'll get all four cards this early on. Clearing out your Normal cards is a higher priority because they don't deal as much damage as the other cards, and you want to reach those cards more quickly. Furthermore, the enemy will not deal much damage in the beginning, so playing Normals is safe at this point. If you get Brights, it may be a good idea to save them, but if you have too many and they're taking up too much space in your limited hand, you may want to play some.

As the enemy takes more damage, it will deal more damage to you (especially in hard mode). Saving your better cards and matches at this point will be helpful. With less cards in the deck, it will also be easier to get matches by month. Alternatively, it's also easier to get the cards needed for synergies (play your synergies wisely too!)

In hard mode, once the enemy has low HP, you should try to one-shot the boss -- otherwise, it may one-shot *you!*

In general, always pay attention to the two Effects text boxes on the left side of the screen. For example, if the enemy has put an effect on the player that will block the player's attack, then don't play your hard hitting cards that turn.

Try selecting different combinations of cards and see which one to play based on the previewed damage in the enemy's health bar too!

**Add it here if you did work that should be factored into your grade but does not fit easily into the proscribed roles! Please include links to resources and descriptions of game-related material that does not fit into roles here.**

# External Code, Ideas, and Structure

If your project contains code that: 1) your team did not write, and 2) does not fit cleanly into a role, please document it in this section. Please include the author of the code, where to find the code, and note which scripts, folders, or other files that comprise the external contribution. Additionally, include the license for the external code that permits you to use it. You do not need to include the license for code provided by the instruction team.

If you used tutorials or other intellectual guidance to create aspects of your project, include reference to that information as well.

For our Card State Machine, we took inspiration from GodotGameLab's Youtube video ["Slay the Spire Clone Godot 4 Tutorial: Card Dragging & State Machines(02/08)"](https://youtu.be/Pa0P1lUoC-M). The author has provided a [Github page](https://github.com/guladam/deck_builder_tutorial/tree/season-1-code) for the project, which is also [MIT Licensed](https://github.com/guladam/deck_builder_tutorial/blob/season-1-code/LICENSE). 
We have implemented parts of the tutorial's code in these following files: 
- [states folder](https://github.com/brokenintercom/ECS179-Hanafueda/tree/main/scripts/states) - all the state scripts were built off of how the tutorial handled swtiching states
- [card.gd](https://github.com/brokenintercom/ECS179-Hanafueda/blob/main/scripts/card/card.gd) -  the functions/signals regarding card states were based off on the tutorial, 
- [card_state_machine.gd](https://github.com/brokenintercom/ECS179-Hanafueda/blob/main/scripts/card/card_state_machine.gd) - we followed the tutorial on how to create the state machine base that had the code for swtiching between states.


For our health bar, we took inspiration from DashNothing's Youtube video ["How to Make a Great Health Barin Godot 4 | Let's Godot"](https://youtu.be/f90ieBOoIYQ). This tutorial video does not have a license shown nor a Github page with links to the code, however in the video summary, the autor encourages usage of the code. 
We implemented parts of from the tutorial in the following files: 
- [health_bar.gd](https://github.com/brokenintercom/ECS179-Hanafueda/blob/main/scripts/health_bar.gd) - majority of how the health bar was animated is from the tutorial, 
- [player_health_bar.tscn](https://github.com/brokenintercom/ECS179-Hanafueda/blob/main/scenes/player_health_bar.tscn) and [enemy_health_bar.tscn](https://github.com/brokenintercom/ECS179-Hanafueda/blob/main/scenes/enemy_health_bar.tscn) - both of these health bar scenes were from the tutorial (the idea to use two overlaying progress bars nodes and a timer node)

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
There are 5 main UI screens that require user input: the title screen, the cutscenes, the battlescreen, the results screen and the credits screen. The game is purely played via mouse, allowing the userBy making the user input purely mouse-only (click-based), we have simplified how the user can interact with the game.

### title screen

TODO: show title screen img here

This is the first screen the user sees when starting the game - the title screen. We have the logo placed in the center closer to the top for emphasis and make the buttons below (`difficultly`, `start`, `credits`, `quit`) easier to see. The difference in text color and the red lines seperating `difficultly` and the rest of the buttons show that the two sections are different. [title scene](https://github.com/brokenintercom/ECS179-Hanafueda/blob/main/scenes/title_screen.tscn)

- **difficulty**: This UI allows the user to click on either the `<` or `>` buttons to choose the difficultly level of the game. Currently, we have `normal` and `hard` mode. The arrow like buttons are meant to give the user a sense of going up (increasing difficulty) or going down (decreasing difficulty). At the end of the list, the side that cannot continue (past hard on the right sde and past normal on the left) has its button disable to prevent the user from thinking that there is more to the list. This is also meant to give a sense of limit, where the player can not go any further.

- **start, credits, quit**: The buttons were ordered specifically this way to create a sense of order and logic. The `start` button allows the user to begin the game, so it is the first on the list. The `credits` button is sandwiched between the other two, as it is neither the beginning nor the end. the `quit` button wraps the list up as pressing this will exit the game, thus ending it, so it comes last.

In general, all buttons do not have a background behind the text showing, making it seem as if there is only text on the screen. Due to this UI decision, the button text will change color when hovering and clicking, indicating that the user is indeed hovering over the button and clicking it.

### battle screen

TODO  add battle screen img

There are many ascepts of the battle screen that were pieced together and placed thoughfully to maximize user interface. [battle scene](https://github.com/brokenintercom/ECS179-Hanafueda/blob/main/scenes/battle_screen.tscn)

TODO add tutorial img
**tutorial**: After the cutscene, the user is introduced to the tutorial popup which can be scrolled past by clicking `next` or going back to the previous slide with `previous`. The popup is meant to give the player a slight breather as well as the rules and how-to's of the game, so they can prepare themselves for the final battle against the enemy. [tutorial scene](https://github.com/brokenintercom/ECS179-Hanafueda/blob/main/scenes/tutorial.tscn)

**card area (player area)**: This is where the player will be able to see their hand of cards. 8 cards are placed evenly spread on the mat. Here, each card is a button, allowing the user to select the card they want to play. By selecting a card, the possible matches for the card is shown by fading out the cards that cannot be matched. To futher indicate that a card has been selected, a blue highlight will surround the chosen card. When cards have been played, their spot will remain empty while the enemy makes his move. This section was styled to have the largest section of the screen to have the player have a clear view of their cards and emphasize that this is the part that requires the most of their attention. [player scene](https://github.com/brokenintercom/ECS179-Hanafueda/blob/main/scenes/player.tscn)
- **enemy**: This is where the player can see their opponent. The enemy boss takes up a noticebly smaller space than the main card area to give the illusion that he is just above our line of sight. [enemy scene](https://github.com/brokenintercom/ECS179-Hanafueda/blob/main/scenes/enemy.tscn)
- **left side bar**: Here is where a lot of information can be found. 
    - **enemy healthbar**: At the top is the enemy healthbar, where is is close to where the enemy physically is on the screen (at the top). It is set an orange color to denote it as an enemy. When taking damage, the healthbar will indicate damage taken with a white color before the white disappears and the orange bar is left. This allows the player to visually see how much life is left in the boss. [enemy healthbar scene](https://github.com/brokenintercom/ECS179-Hanafueda/blob/main/scenes/enemy_health_bar.tscn)
    - **enemy effects**: This is where we can see the effects the player has placed on the enemy. Since it is still part of the enemy's info, it is grouped on the top of the screen, just below the healthbar. [enemy effects scene](https://github.com/brokenintercom/ECS179-Hanafueda/blob/main/scenes/enemy_effect.tscn)
    - **synergy**: This is where we can see the synergies of the cards we have played displayed. [synergy scene](https://github.com/brokenintercom/ECS179-Hanafueda/blob/main/scenes/synergy.tscn)
    - **home, help, play**: Here we have a line of buttons. All of the following buttons have different sprites to differentiate hovering, pressing and no action.
            TODO insert home img
        - home: At the most left and furthest away from the main card area, is the home button. Clicking on the button will reseult in a confirmation popup that checks if the player wishes to return to the title and end game.
            TODO insert help img
        - help: At the center is the help button which will popup an index of subjects to look for help on. Selecting one of the listed elements will result in a side bar. The side bar is place convienently above the card area, so that the player can look at both the help and their cards to decide their next move. 
        - play: Closest to the main play area is the play button. Unlike the other two buttons, if no cards are selected, this button is disabled. We disabled the button because the player cannot play their hand if they do not select a card, thus disabling simply takes away the ability to play no cards.
    - **deck**: By clicking on the deck, the player is able to see their whole deck of cards, such as the ones currently on hand, ones that have already been played, and ones that have not been drawn yet. The point of this mechanism is so that players can plan ahead and/or keep track of what they have played already. [deck view scene]((https://github.com/brokenintercom/ECS179-Hanafueda/blob/main/scenes/deck_view.tscn))
    - **player effects**: Similar to the enemy effects, except this shows what effects the enemy has *placed on* the player. 
    - **player healthbar**: The color green is often used to indicate the player's healthbarin various games, thus our player's healthbar is also green. It has the same mechanisms as the enemy's healthbar and it serves to allow the player to have both a visual sense (bar decreasing/increasing) and numerical sense (the XX/100 HP) of their health. [player healthbar scene](https://github.com/brokenintercom/ECS179-Hanafueda/blob/main/scenes/player_health_bar.tscn)
### results screen

TODO add results screen

The results screen has two endings: a lose and win screen. The game result is printed nice and large to remove any ambiguity on the results of the game. Both endings will have the option to immediately quit the game or go back to the title screen where player can view credits or play again by clicking start on the title screen. The quit button comes after the return to title since it acts as an ending to the game, where  once clicked player will exit the game permanently (until restarted again). [results scene](https://github.com/brokenintercom/ECS179-Hanafueda/blob/main/scenes/results_screen.tscn)

### credits screen

TODO add credits screen

The credits list out the roles and subroles and their names of our team. There is a back button that leads the player back to the title screen. We decided that it was better to have the credits in the begining than at the end since this way, if the player is curious, we have our credits easily reachable. The title screen is also the most swtiched to screen, so it was simply easier this way. [credits scene](https://github.com/brokenintercom/ECS179-Hanafueda/blob/main/scenes/credits_screen.tscn)

### default input configuration
From the beginning, for the sake of simplicity, we decided to have our user input be done completely with mouse only (specifically left-mouse click only). This means that all user input is done through clicking various buttons to play the game. Our game has various buttons set up such that users can play the game smoothly as well as move between screens.

### website
Using itch.io, Tim uploaded our game to our [website](https://brokenintercom.itch.io/hanafueda), making it playable without having to download the game itself.

Additionally, as the game can be accessed on the web, it can also be played on the mobile phone as long as the game is acessed from our website.

## Enemy Effects/AI (Chris Wang)

**Describe the basics of movement and physics in your game. Is it the standard physics model? What did you change or modify? Did you make your movement scripts that do not use the physics system?**

## Animation and Visuals (Yujin Cho)

### Theme/Inspirations

The theme for our game was inspired by the Hanafuda deck of cards, which I was familiar with through playing Min-Hwatu/Go-Stop (which are Korean card games that use a derivative of this deck of cards) with my family. I thought it would be interesting to create a Balatro-like game using a deck of cards that is organized differently than the traditional deck of cards we know. The mechanics of the game wrote themselves pretty easily after establishing how this deck of cards is organized (12 months and 4 types).

Aesthetically, I was inspired by Balatro and other table-top like pixel art games. Balatro was the main inspiration for the layout of the battle scene, with the menu/sidebar to the left, and the main card playing area to the right. I was also particularly inspired by Papers Please for the intro cutscene (with all the papers on the desk), the lineless/simple artstyle, and the mimicking of the hectic nature of reorganizing objects on a desk. 

I designed the characters based on the animals on the cards. The main boss/yakuza is a red-crowned crane, which is the animal on the January card. If I was to extend this game, I would go through all the months and make an animal-themed boss for each of them. The player character is a rabbit, which is a humble character used often in Japanese folklore. Additionally, my initial game pitch was a burrowing rabbit rogue-like, so it was a small callback to that.

### Assets

I created all of our visual assets myself using Aseprite.

I created my own font for the main Hanafeuda logo and the skip/play buttons, but the other fonts used in game are either [Silkscreen](https://fonts.google.com/specimen/Silkscreen) or [C&C Red Alert](https://www.dafont.com/c-c-red-alert-inet.font). Both fonts are free both for personal and commercial use.

I am satisfied with the overall theming I created for the game with the assets and narrative design. I really wanted to make a game that looked like a cohesive and unique product, and I think that taking the time to make all the assets made a product fulfilled that.

### Implementation 

Implementation wise, all of the sprites were exported as PNGs and put into the game in some sort of Sprite2D node. If I had done this again, I would have exported them all as SVGs, which would make the pixels more crisp when viewed at a larger scale. 

The player and enemy are both separate scenes, and all of the UI related to them (their corresponding health bars and the player's hand) are also contained in that scene. The healthbar UI is built of separate Sprite2D nodes layered on top of each other through Z axis offsetting. The healthbars themselves are two different instances of a TexturedHealthBar that Jamie made, so that the boss and the player could have separate colored bars.

The animation for the boss was a combination of simple "puppet" animation in Aseprite (creating separate sprites in a sprite sheet) and using the offset function in AnimationPlayer to make the sprite move back and forth smoothly during the attack and hit animations. The [animation timing](https://github.com/brokenintercom/ECS179-Hanafueda/blob/1ab07ca66e3e1c6f2397a703dd238b03c3417fd7/scripts/characters/enemy.gd#L57) was done in code using timers, which ensured that the attack sound/player's HP bar depleting happened at the bottom of the enemy animation. It also ensures that the enemy's animation returns to idle after it attacks.

All other assets were static assets, implemented mainly by cutting the sprites out of sprite sheets using Godot's AtlasTexture function.

The cutscene consists of one video edited by Tim, which was implemented through the AnimationPlayer node. This allowed us to achieve a more dynamic cutscene than if we animated everything straight in Godot. The skip button for the cutscene was implemented using a [signal](https://github.com/brokenintercom/ECS179-Hanafueda/blob/1ab07ca66e3e1c6f2397a703dd238b03c3417fd7/scripts/screens/intro_cutscene_screen.gd#L4) attached to a button, which would notify the scene manager to load in the battle_screen.


## Game Logic (Yoobin Jin)
The game has 3 main states: the title screen, battle screen, and results screen. Each "screen" was its own scene that is "loaded" by a [scene manager](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/screens/scene_manager.gd) by deleting the node for the previous screen and adding the next screen as a child. Having a scene manager was inspired by how we went through the different mini games from discussion. Besides switching scenes, the scene manager ensures that certain singletons (such as the player) are not visible at the start of the game.

My goal was to try and incorporate ideas of the component pattern, breaking down the code into components, use inheritance, and try to generalize when possible.
* [player.gd](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/characters/player.gd) and [enemy.gd](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/characters/enemy.gd) inherit from [character.gd](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/characters/character.gd), which defines some common attributes and functions for both characters. For example, they both have `max_health`, `curr_health`, and `_finish_turn()` which does some clean up before switching phases (player to enemy and vice versa).
    * Unfortunately, I was unable to generalize some of the signals for the characters. For example, I have separate `player_hit` and `enemy_hit` signals even though they behave similarly to ensure that both characters are not listening to the same signal (causing the code to run twice).
    * Note: the player and enemy are both global since many different game states/screens and other objects will need to access or modify these characters.
* The player has a `Hand` containing a grid container of texture buttons representing the cards. The texture buttons were convenient because I thought it would be easiest if the cards were buttons themselves, making interactions with the cards easier.
    * I only made use of the `texture_normal` attribute and not the other textures because we already have many sprites (48 sprites for just the cards!), so making slightly modified sprites for when the button is clicked, disabled, etc. didn't seem like a good idea. Instead, these attributes are modified through the state machine (discussed later)


### Battle Screen
The [battle screen](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/screens/battle_screen.gd) starts off by ensuring the player and enemy nodes (which are global) are visible since their `visible` attributes should have been disabled earlier. The battle screen also needs to listen for a `switch_battle_phase` signal to know when to update `_curr_phase` and call either `_player_phase()` or `_enemy_phase()` as needed. These functions check for the win/lose condition. If the player hasn't definitively won or lost, then the player (or enemy) can take their action. For example, the player's turn starts by drawing cards.

The battle screen is connected to the signal emitted when the "play cards" button is pressed. The battle screen passes the signal onto the player by calling the player's `play_cards()` function. This function calculates the damage based on the player's selected cards, deals damage to the enemy via the `enemy_hit` signal, applies any synergy if the player's selected cards had a synergy, and cleans up (discussed further in the Player section)

The battle screen also has a few other variables like `synergy_ui`, but these variables are mostly for passing onto the player or enemy since they need to access some of these variables. For example, when the player plays cards that activate a synergy, `synergy_ui`'s text needs to be updated on the screen.


### Player
The player has a lot of data that needs to be managed. These include the hand, cards, deck, and selected cards. It also gets access to `_match_label` and `_synergy_ui` when the battle screen is loaded in order to update the text associated with these UI components on the screen whenever the player is matching by month/type and when the player has activated a synergy.

The player also has a hand (which has cards and a card state machine), a deck, an array of selected cards, and an array of discarded/used cards. All of these except the discard pile is discussed below. The discard pile was supposed to be used for potentially adding more mechanics to the game, but due to time constraints, these mechanics were not implemented.

The player also has a `did_win` variable which is primarily used when the results screen needs to display the correct message.


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
[card_pile.gd](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/card/card_pile.gd) is simply an array of `CardSpecs`. The card pile is extended by [deck.gd](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/card/deck.gd), which is initialized using [deck.csv](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/assets/deck_csv/deck.csv). Ideally, other card-pile-like variables like the `selected_cards` variable in `player.gd` would be of class `CardPile`, though then we may have had to implement a custom iterator and handle other sorts of complexities (given how we manipulate `selected_cards` in the code). So for simplicity, we left `selected_cards` as simply `Array[CardSpec]`.

When `draw_card()` is called, the card at the top of the deck is drawn since an actual deck is drawn as if it's a stack (popping from the end of the array is more efficient too, as opposed to the beginning). The function returns a `CardSpec`, and in the player's `draw_cards()`, the `CardSpec` is used to update the current card button's attributes.

The player can also click on the deck to make the [deck view](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/card/deck_view.gd) visible. This shows the entire contents of the deck with all the cards arranged by month. The cards will be grayed out if they've been played already, helping players plan out their future moves by knowing which cards have been played and which ones haven't been played yet.

The deck view primarily consists of a horizontal container called `Cards` which contains a vertical box container for each month, and overall `Cards` contains *all* the cards in the deck view. To get the right month (vertical box) container, we index into `Cards.get_children()` using the card's month enum. To get the appropriate sprite within this vertical container, the card has an `index` variable that's used to index into the container's `get_children()`.


#### Matching logic
In [hand.gd](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/card/hand.gd), its various functions are called every time a card is selected or deselected. We iterate through the array of selected cards starting from the beginning. First, we determine what category we're matching by (month or type). There is also an edge case where both month and type are viable categories, though the card damage will be calculated using the type by default in this case.

Then, we iterate through all the card buttons and determine if they have the same month (if matching by month, and similarly with type) as the selected cards' month. If they match, the card remains in the enabled state. Otherwise, the card transitions to disabled.


#### Damage Engine
The [Damage Engine](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/damage_engine.gd) uses a similar approach as the one in exercise 3. Its functions are static, and enums are used to index into a grid/array to determine the damage. 

This strategy also allows us to easily modify how many points each type does, which was better than our initial implementation where the type enum's internal integer values were hard-coded in the enum definition instead (which means the values cannot be dynamically changed anymore). This aspect of easily modifying the point value of each type was to help make it easier for a future possible addition of upgrading the player's deck so that each card does more damage than before.


#### Enemy
As a placeholder, the [enemy](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/characters/enemy.gd) originally always did 10 damage to the player on its turn. Later, I adjusted the enemy's attack to deal more damage as it loses more HP. There is some randomness still. We get a `random_factor` between 0.1 and 0.3, then determine the damage as either 3 or `int(dmg_taken * random_factor)`, (we pick whichever one is bigger). As someone who has adjusted to the game, this provided a sufficient challenge, but since some people noted its difficulty (especially considering that they were new to the game), this became a "hard" mode, and Chris made an easier damage calculation, becoming the "normal" mode. Jamie implemented the difficulty selection in the title screen.



#### Misc.
The player's `finish_turn()` function moves all selected cards into the discard pile. More specifically, each card button's attributes are encapsulated into a `CardSpec` and put into the discard pile, similar to how the deck is an array of `CardSpec` objects. Since the card is considered to be in the discard pile, the card button transitions to the "empty" state, and the number of hands in the player's hand decreases. Unselected cards transition to the enabled state if they are not already.

**Some various tasks I also helped with that don't necessarily fit in game logic:**
* Assisting in the initial brainstorming/draft of the tutorial
* Modifying delays (started by Jamie) to cleanly show when the player acts, when the enemy acts, etc.
    * After the player emits the `enemy_hit` signal, the player waits 1 second for the enemy's health bar to finish updating
    * At the start of the enemy's turn in `actions()`, it waits 1 second before doing anything
    * After the enemy emits the `player_hit` signal, the enemy waits 1 second for the player's health bar to update
* Arranging the cards to line up with the table sprite, plus general setup of the node hierarchy/tree for the player
* Initial formatting of the results screen
* Implementing a simple [CustomLabel](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/custom_label.gd) to do dynamic font size adjustments for the synergy UI since there is an edge case where multiple synergies could be active (and could be used for the Effects UI)
    * It decreases the label's font size by 1 while there is more than 1 line in the label
    * There is a `MatchLabel` in the battle screen that works similarly to `CustomLabel` but is overall much simpler. It displays whether the player's currently selected cards will be calculated based on type or month
* Simple animation of the enemy turning red and back to normal when the enemy is attacked to provide a visual cue that the enemy is reacting to the player's actions.
* I created the [card types scene](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scenes/help_screen/card_types.tscn) and [combos scene](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scenes/help_screen/card_types.tscn) based on the existing framework Tim made for the rest of the help screen
* Implementing a feature where a card's month and type are shown [when hovering over the card](https://github.com/brokenintercom/ECS179-Hanafuda/blob/main/scripts/card/card.gd). This was added due to a suggestion by a player during the final festival!


# Sub-Roles

## Audio (Chris Wang)

**List your assets, including their sources and licenses.**

**Describe the implementation of your audio system.**

**Document the sound style.** 

## Gameplay Testing (Yoobin Jin)
[Folder with all the gameplay testing feedback](https://drive.google.com/drive/folders/1DyaJhIkGbmhw26LUqKUENERbS_XLwIGB?usp=sharing)

I asked 5 non-gamers to help test the game. Tim and Chris also helped by asking gamer friends to test the game as well, so we have more variety. The summary/analysis of the feedback is below.

### Tutorial
* There’s a lot of detail at first (overwhelming)
    * **Fix:** Main thing would probably be to take out the detailed math calculations in the tutorial. That could be reserved for the help menu if the user wants to learn more
* Some things are not explicitly said which causes confusion
    * All 8 cards are yours (the enemy does not use any cards)
    * You draw until there are 8 cards in your hand, and any unused cards will remain in your hand for your next turn
    * You can select as many cards as you want
    * The strategy is to either match by type or by month!! Really emphasize this (e.g., if matching by type, they are all ribbons)
    * Make it even clearer why the cards get grayed out, and that cards that are still colored in can still be selected
    * After you play your cards, the enemy will automatically attack you back, then it will be your turn again. i.e., make explicit what the enemy is doing
    * **Fix:** Rework the tutorial to explicitly mention these things


### Common suggestions
* Having a help button to remind you of important details in the tutorial would be great, especially considering the tutorial's length and detail
    * We were already planning on doing this, it just wasn’t implemented yet when some of the testers played the game. Still, this feedback was useful because it emphasized how important it was that we implement this feature
* When you have cards selected, visually show in the health bar how much damage you would deal
    * Similarly with the previous suggestion, we were planning on doing this, but it hadn't been implemented yet. Regardless, we now know how important this feature would be to players.
* Have a list of all the cards that show what they look like and how they are grouped by month and type
    * Like above, we were planning on implementing this (though it had a lower priority compared to the other features)
* There should be a clear indication about the battle phase changes and the results of every action
    * **Fixes:** 
        * Add delays between the enemy's health bar being updated (after the player attacked) and when it's actually the enemy's turn.
            * This is because currently the health bars appear to be updated at the same time because there is no delay between the player's action (attacking the enemy) and the enemy's action (attacking the player).
        * Visually change the enemy (e.g., add a simple animation to the enemy like its eye flashing) when it's attacking. We can also have a specific sound clip that plays when it attacks so that it's obvious the enemy is taking its turn
* Show where your selected cards are matching by month, or type
    * **Fix:** We could add another text box like synergy and effects on the battle screen.


### Misc.
* Length of game was either just right or possibly a little short
   * **Fix:** Add more battles! However, we likely cannot do this given our time constraints
   * Though, the tutorial sometimes felt somewhat long. To be fair, there’s a lot of rule stuff going on
      * **Fix:** Introduce parts of the game gradually to the user, perhaps a tutorial game before doing the real fight. However, we likely can’t do this because of time constraints
* Having a battle log that shows the past actions taken would be helpful (this would be a good idea, but unfortunately we didn't have the time to do this either)
* Having a player opponent (instead of AI) may be more challenging
* The art/visuals were interesting and engaging!
* The testers liked the yakuza premise
* The UI was easy to use
* The testers felt more excited when their attacks did a lot (reward for doing good combos!) and also when they lost more and more health (challenge!)
* Dialogue with the enemy would make things feel more engaging


## Narrative Design (Yujin Cho)

The narrative of this game was inspired by the general attitude around Hanafuda games that I have noticed - basically that they are gambling games and are pretty taboo in Asian cultures (I was never allowed to look at my parents playing these games as a kid). As a result, I thought it would be interesting to have gambling to be the major driving force behind the conflict of the story. 

The cutscene also explains the use of cards as an offensive weapon, though if I had more time, I would have liked to go into how this character is fighting off a boss using cards (maybe they were given magic powers within the cards or something?).

I implemented the game's story using the intro cutscene and by using assets that have a common style throughout all scenes. The main character's table in the cutscene is also the table that is used to play cards in battle scene, and the positioning of the two characters also flows between scenes. 

## Press Kit and Trailer (Tim Dela Cruz)

**Include links to your presskit materials and trailer.**

**Describe how you showcased your work. How did you choose what to show in the trailer? Why did you choose your screenshots?**

## Game Feel and Polish (Jamie Hsi)

- **timer delay**: When we first implmented the player and enemy turns, the healthbar would react so fast that it felt as if the action was instantaneous. To counter this and make it feel like we can actually see the steps of a turn based game (player attacks, enemy takes damage, enemy attacks, player takes damage, repeat), we added multiple delays. I created the base of the timer delay which delayed before and after the enemy moves, for which while the enemy is still "playing", all player input is disabled. This disabling feature is meant to futher emphasize that it is NOT the player's turn and it is the enemy's. It also helps prevent any sudden crashes of the game due to user interaction. Yoobin later polished the delays to make them smoother.
- **confirmation pop-up**: While this has been mentioned in the UI/UX section, this was added on later to help polish game feel. Originally, if we had clicked the home button, the player would be instantly transported back to the title screen. The instant teleportation did not feel right, especially if the player was in the middle of a game, thus a confirmation popup was added.
- **enemy animation**: While I personally did not code this and two of our teammates did (Yujin and Yoobin), I brought up the fact that orginally it was hard to tell when the enemy was taking action and it was hard to track the passing of time. To fix this, we have implemented a flashing red animation for when the enemy took damage and a slight swooping motion for when the enemy attacks. By visually seeing the order of enemy take damage -> enemy attak -> player take damage, the player is able to have a better grasp of timing in the game.
- **tutorial slide numbers**: I noticed that it was hard to tell where in the tutorial the player was in, given that we had a very long tutorial. With the numbered slides, players are able to have a better grasp of where they are in the tutorial, once again giving them back a sense of time.
- **adding difficulty levels**: It was mentioned that some people thought the game was too easy, so I have implemented a way for the player to choose thier difficulty level. However, this must be done at the very begining (title screen).
- **dmg calculations preview**: We thought that giving the player the ability to see how much potential damage their cards will deal can be very helpful when playing, instead of playing cards blindly. Adding this feature allows players to visually see the damage they can deal to the enemy based on different selections and combinations of their cards. This helps the player feel less lost when choosing their cards.

