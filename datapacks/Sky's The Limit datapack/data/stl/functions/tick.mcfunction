#Clock \/
scoreboard players add @e[tag=Setup] Time 1
execute as @e[tag=Setup] if score @s Time matches 20.. unless score @s countdown matches -1 run function stl:count
execute as @e[tag=Setup] if score @s Time matches 20.. unless score @s countdown matches -1 run scoreboard players remove @s countdown 1
execute as @e[tag=Setup] if score @s Time matches 20.. run scoreboard players set @s Time 0

#Scoreboard management \/
#scoreboard players operation @a Leaderboard = @a backScore
execute as @e[tag=Setup,scores={isGameStarted=0}] run scoreboard players set @a[team=!Active] Height 0
execute as @e[tag=Setup,scores={isGameStarted=0}] run scoreboard players add @a[team=!Active] Leaderboard 0
execute as @a[name=!"Corteszx",name=!"TheDeafCreeper"] run scoreboard players set @s isOpped 0 
execute as @e[tag=Setup,scores={isGameStarted=1}] run scoreboard players reset @a[team=!Active] Height

execute as @e[tag=Setup,scores={isGameStarted=1}] as @a[team=Active] store result score @s Height run data get entity @s Pos[1]

#XP Bar \/
execute as @a if score @s DisplayLevel < @s Height run scoreboard players add @s DisplayLevel 1
execute as @a if score @s DisplayLevel > @s Height run scoreboard players remove @s DisplayLevel 1
execute as @a[team=Active] run title @s actionbar [{"text":"Y Level: ","color":"black"},{"score":{"name":"@s","objective":"DisplayLevel"},"color":"black","bold":true}]

#TNT Arrows \/
execute at @e[type=arrow,nbt={Potion:"minecraft:harming",inGround:1b}] run summon creeper ~ ~ ~ {Fuse:0,ignited:1,powered:1,CustomName:'{"text":"Explosive Arrow","color":"dark_red","bold":true}'}
kill @e[type=arrow,nbt={Potion:"minecraft:harming",inGround:1b}]

#Build platform \/
execute at @e[tag=Setup] run fill ~-7 ~-2 ~-7 ~7 ~-2 ~7 dirt replace
execute at @e[tag=Setup] run fill ~-7 ~-3 ~-7 ~7 ~-3 ~7 stone_bricks replace

execute at @e[tag=Setup] run fill ~-8 ~-2 ~-8 ~-8 ~-3 ~8 stone_bricks replace
execute at @e[tag=Setup] run fill ~-8 ~-2 ~-8 ~8 ~-3 ~-8 stone_bricks replace
execute at @e[tag=Setup] run fill ~8 ~-2 ~8 ~8 ~-3 ~-8 stone_bricks replace
execute at @e[tag=Setup] run fill ~8 ~-2 ~8 ~-8 ~-3 ~8 stone_bricks replace

# Repair Checkpoint \/
execute at @e[tag=Setup,scores={cpReached=1}] run setblock ~-14 50 ~-13 minecraft:air
execute at @e[tag=Setup,scores={cpReached=1}] run setblock ~-14 50 ~-13 minecraft:redstone_block
execute at @e[tag=Setup,scores={cpReached=1}] run fill ~1 52 ~10 ~-1 55 ~13 air

# Misc \/
effect give @a saturation 10 255 true