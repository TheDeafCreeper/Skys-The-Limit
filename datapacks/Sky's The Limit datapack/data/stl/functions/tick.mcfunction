#Clock \/
scoreboard players add @e[tag=Setup] Time 1
execute as @e[tag=Setup] if score @s Time matches 20.. unless score @s countdown matches -1 run function stl:count
execute as @e[tag=Setup] if score @s Time matches 20.. unless score @s countdown matches -1 run scoreboard players remove @s countdown 1
execute as @e[tag=Setup] if score @s Time matches 20.. run scoreboard players set @s Time 0

#Scoreboard management \/
execute if score GameStarted GameState matches 0 run scoreboard players set @a[team=!Active] Height 0
execute if score GameStarted GameState matches 0 run scoreboard players add @a[team=!Active] Leaderboard 0
execute if score GameStarted GameState matches 1 run scoreboard players reset @a[team=!Active] Height

execute if score GameStarted GameState matches 1 as @a[team=Active] store result score @s Height run data get entity @s Pos[1]

#XP Bar \/
execute as @a[team=Active] run scoreboard players operation @s DisplayLevel = @s Height
#execute as @a[team=Active] run scoreboard players operation @s DisplayLevel += Const GameState
execute as @a[team=Active] run title @s actionbar [{"text":"Y Level: ","color":"black"},{"score":{"name":"@s","objective":"DisplayLevel"},"color":"black","bold":true}]

#Kill Pearls
execute positioned 0 -64 0 if score CheckPointReached GameState matches 1 as @e[type=minecraft:ender_pearl,y=-64,dy=114,x=-32,dx=64,z=-32,dz=64] run kill @s
execute positioned 0 -64 0 if score CheckPointReached GameState matches 2 as @e[type=minecraft:ender_pearl,y=50,dy=150,x=-32,dx=64,z=-32,dz=64] run kill @s

#TNT Arrows \/
execute at @e[type=arrow,nbt={Potion:"minecraft:harming",inGround:1b}] run summon creeper ~ ~ ~ {Fuse:0,ignited:1,powered:1,CustomName:'{"text":"Explosive Arrow","color":"dark_red","bold":true}'}
kill @e[type=arrow,nbt={Potion:"minecraft:harming",inGround:1b}]

#Build platform \/
execute positioned 0 -64 0 run fill ~-7 ~1 ~-7 ~7 ~1 ~7 dirt replace
execute positioned 0 -64 0 run fill ~-7 ~ ~-7 ~7 ~ ~7 stone_bricks replace
execute positioned 0 -64 0 run fill ~-8 ~ ~-8 ~8 ~1 ~8 stone_bricks replace air

# Repair Checkpoint \/
execute positioned 0 100 0 if score CheckPointReached GameState matches 1 run setblock ~-14 ~ ~-13 minecraft:air
execute positioned 0 100 0 if score CheckPointReached GameState matches 1 run setblock ~-14 ~ ~-13 minecraft:redstone_block
execute positioned 0 50 0 if score CheckPointReached GameState matches 1 run fill ~1 ~1 ~10 ~-1 ~3 ~13 air

execute positioned 0 200 0 if score CheckPointReached GameState matches 2 run setblock ~-14 ~ ~-13 minecraft:air
execute positioned 0 200 0 if score CheckPointReached GameState matches 2 run setblock ~-14 ~ ~-13 minecraft:redstone_block
execute positioned 0 200 0 if score CheckPointReached GameState matches 2 run fill ~1 ~1 ~10 ~-1 ~3 ~13 air

# Misc \/
effect give @a saturation 10 255 true