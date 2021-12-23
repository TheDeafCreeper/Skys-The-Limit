execute as @e[tag=Setup] store result bossbar minecraft:countdown value run scoreboard players get @s countdown
execute as @e[tag=Setup] if score @s countdown matches 1.. run playsound minecraft:block.note_block.snare ambient @a ~ ~ ~

execute as @e[tag=Setup] if score @s countdown matches 0 run function stl:start
execute as @e[tag=Setup] if score @s countdown matches 0 run scoreboard players set @e[tag=Setup] isCounting 0
execute as @e[tag=Setup] if score @s countdown matches 0 run bossbar set countdown players