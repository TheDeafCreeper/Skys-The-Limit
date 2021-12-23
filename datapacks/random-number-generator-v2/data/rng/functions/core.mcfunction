#Crimson Tardis

execute as @e[scores={RNG=1..}] run scoreboard players set @s NUM 0
execute as @e[scores={RNG=1..}] run scoreboard players set @s BIN 1
execute as @e[scores={RNG=1..}] at @s run function rng:step_1

scoreboard players set 2 NUM 2
scoreboard players set 1 NUM 1

#RNG = inpuy
#NUM = output