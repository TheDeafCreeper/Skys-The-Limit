execute store result bossbar minecraft:countdown value run scoreboard players get Countdown GameState
execute if score Countdown GameState matches 1.. run playsound minecraft:block.note_block.snare ambient @a ~ ~ ~

execute if score Countdown GameState matches 1.. run schedule function stl:count 1s
scoreboard players remove Countdown GameState 1
execute if score Countdown GameState matches 0 run function stl:start
execute if score Countdown GameState matches 0 run bossbar set countdown players