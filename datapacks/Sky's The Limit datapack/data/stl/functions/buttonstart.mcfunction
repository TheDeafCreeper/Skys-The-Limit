execute as @a run scoreboard players add Online GameState 1
execute if score Countdown GameState matches 0.. run tellraw @p {"text": "Already started!","color": "#de4343"}
execute if score Countdown GameState matches -1 if score Online GameState matches 2.. run function stl:countstart
execute if score Countdown GameState matches -1 if score Online GameState matches ..1 run tellraw @a {"text": "Not enough players to start the game!","color": "#de4343"}
scoreboard players set Online GameState 0