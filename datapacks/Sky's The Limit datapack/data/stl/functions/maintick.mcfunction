#Team management \/
execute if score GameStarted GameState matches 1 run team join Spectator @a[team=!Active]
execute if score GameStarted GameState matches 0 run team join Lobby @a[team=!Lobby,team=!Victory]

execute as @a[team=Lobby,scores={isOpped=0}] run gamemode adventure @s
execute as @a[team=Victory,scores={isOpped=0}] run gamemode adventure @s
execute as @a[team=Active,scores={isOpped=0}] run gamemode survival @s
execute as @a[team=Spectator,scores={isOpped=0}] run gamemode spectator @s

execute as @r[team=Active] at @s unless entity @a[team=Active,distance=0.01..] unless entity @a[team=Active,scores={Height=200..}] run tellraw @a {"text":"Not enough players ingame, canceling game.","color":"dark_red","bold":true}
execute as @r[team=Active] at @s unless entity @a[team=Active,distance=0.01..] unless entity @a[team=Active,scores={Height=200..}] run function stl:load

#Inventory Management \/
clear @a[team=Lobby,scores={isOpped=0}]
clear @a[team=Victory,scores={isOpped=0}]
clear @a[team=Spectator,scores={isOpped=0}]
item replace entity @a[team=Active] inventory.18 with minecraft:stone_sword{Enchantments:[{id:"minecraft:knockback",lvl:3s}]}
item replace entity @a[team=Active] inventory.20 with minecraft:bow{Enchantments:[{id:"minecraft:punch",lvl:2s},{id:"minecraft:infinity",lvl:1s}]}
item replace entity @a[team=Active] inventory.19 with minecraft:iron_pickaxe{Enchantments:[{id:"minecraft:efficiency",lvl:3s}]}

execute as @a store result score @s PearlCount run clear @s minecraft:ender_pearl 0
give @a[team=Active,scores={PearlCount=0..8}] ender_pearl 8

#Item block color \/
execute as @a[team=Active,scores={blockColor=0}] store result score @s BlockCount run clear @s minecraft:red_concrete 0
execute as @a[team=Active,scores={blockColor=1}] store result score @s BlockCount run clear @s minecraft:orange_concrete 0
execute as @a[team=Active,scores={blockColor=2}] store result score @s BlockCount run clear @s minecraft:yellow_concrete 0
execute as @a[team=Active,scores={blockColor=3}] store result score @s BlockCount run clear @s minecraft:lime_concrete 0
execute as @a[team=Active,scores={blockColor=4}] store result score @s BlockCount run clear @s minecraft:green_concrete 0
execute as @a[team=Active,scores={blockColor=5}] store result score @s BlockCount run clear @s minecraft:light_gray_concrete 0
execute as @a[team=Active,scores={blockColor=6}] store result score @s BlockCount run clear @s minecraft:blue_concrete 0
execute as @a[team=Active,scores={blockColor=7}] store result score @s BlockCount run clear @s minecraft:light_blue_concrete 0
execute as @a[team=Active,scores={blockColor=8}] store result score @s BlockCount run clear @s minecraft:cyan_concrete 0
execute as @a[team=Active,scores={blockColor=9}] store result score @s BlockCount run clear @s minecraft:pink_concrete 0
execute as @a[team=Active,scores={blockColor=10}] store result score @s BlockCount run clear @s minecraft:purple_concrete 0
execute as @a[team=Active,scores={blockColor=11}] store result score @s BlockCount run clear @s minecraft:gray_concrete 0
execute as @a[team=Active,scores={blockColor=12}] store result score @s BlockCount run clear @s minecraft:black_concrete 0
execute as @a[team=Active,scores={blockColor=13}] store result score @s BlockCount run clear @s minecraft:white_concrete 0
execute as @a[team=Active,scores={blockColor=14}] store result score @s BlockCount run clear @s minecraft:red_terracotta 0
execute as @a[team=Active,scores={blockColor=15}] store result score @s BlockCount run clear @s minecraft:orange_terracotta 0
execute as @a[team=Active,scores={blockColor=16}] store result score @s BlockCount run clear @s minecraft:yellow_terracotta 0
execute as @a[team=Active,scores={blockColor=17}] store result score @s BlockCount run clear @s minecraft:lime_terracotta 0
execute as @a[team=Active,scores={blockColor=18}] store result score @s BlockCount run clear @s minecraft:green_terracotta 0
execute as @a[team=Active,scores={blockColor=19}] store result score @s BlockCount run clear @s minecraft:light_gray_terracotta 0
execute as @a[team=Active,scores={blockColor=20}] store result score @s BlockCount run clear @s minecraft:blue_terracotta 0
execute as @a[team=Active,scores={blockColor=21}] store result score @s BlockCount run clear @s minecraft:light_blue_terracotta 0
execute as @a[team=Active,scores={blockColor=22}] store result score @s BlockCount run clear @s minecraft:cyan_terracotta 0
execute as @a[team=Active,scores={blockColor=23}] store result score @s BlockCount run clear @s minecraft:pink_terracotta 0
execute as @a[team=Active,scores={blockColor=24}] store result score @s BlockCount run clear @s minecraft:purple_terracotta 0
execute as @a[team=Active,scores={blockColor=25}] store result score @s BlockCount run clear @s minecraft:gray_terracotta 0
execute as @a[team=Active,scores={blockColor=26}] store result score @s BlockCount run clear @s minecraft:black_terracotta 0
execute as @a[team=Active,scores={blockColor=27}] store result score @s BlockCount run clear @s minecraft:white_terracotta 0

#Give Blocks \/
execute as @a[team=Active,scores={BlockCount=..32}] run function stl:giveblock

#Checkpoint \/
execute as @a unless score @s CheckPoint matches 0.. run scoreboard players set @s CheckPoint 0
execute as @a unless score @s CheckPoint matches 1.. if score @s Height matches 0.. run scoreboard players set @s CheckPoint 1
execute as @a unless score @s CheckPoint matches 2.. if score @s Height matches 50.. run scoreboard players set @s CheckPoint 2
execute as @a unless score @s CheckPoint matches 3.. if score @s Height matches 100.. run scoreboard players set @s CheckPoint 3
execute as @a unless score @s CheckPoint matches 4.. if score @s Height matches 150.. run scoreboard players set @s CheckPoint 4
execute as @a unless score @s CheckPoint matches 5.. if score @s Height matches 200.. run scoreboard players set @s CheckPoint 5
execute as @a unless score @s CheckPoint matches 6.. if score @s Height matches 250.. run scoreboard players set @s CheckPoint 6

spawnpoint @a[scores={CheckPoint=0}] 0 -61 0
spawnpoint @a[scores={CheckPoint=1}] 0 1 11
spawnpoint @a[scores={CheckPoint=2}] 0 51 11
spawnpoint @a[scores={CheckPoint=3}] 0 101 11
spawnpoint @a[scores={CheckPoint=4}] 0 151 11
spawnpoint @a[scores={CheckPoint=5}] 0 201 11
spawnpoint @a[scores={CheckPoint=6}] 0 251 11

execute positioned 0 -64 0 if score GameStarted GameState matches 1 if score CheckPointReached GameState matches 0 if entity @a[scores={Height=0..}] run function stl:checkpoint
execute positioned 0 -64 0 if score GameStarted GameState matches 1 if score CheckPointReached GameState matches 1 if entity @a[scores={Height=50..}] run function stl:checkpoint
execute positioned 0 -64 0 if score GameStarted GameState matches 1 if score CheckPointReached GameState matches 2 if entity @a[scores={Height=100..}] run function stl:checkpoint
execute positioned 0 -64 0 if score GameStarted GameState matches 1 if score CheckPointReached GameState matches 3 if entity @a[scores={Height=150..}] run function stl:checkpoint
execute positioned 0 -64 0 if score GameStarted GameState matches 1 if score CheckPointReached GameState matches 4 if entity @a[scores={Height=200..}] run function stl:checkpoint
execute positioned 0 -64 0 if score GameStarted GameState matches 1 if score CheckPointReached GameState matches 5 if entity @a[scores={Height=250..}] run function stl:checkpoint

#Victory \/
execute as @a[team=Active,scores={Height=320..}] run function stl:victory

#Misc
effect give @a[team=!Active] resistance 10 255 true
effect give @a[team=!Active] regeneration 10 255 true
effect give @a[team=!Active] weakness 10 255 true
execute positioned 0 -89 0 run kill @a[team=Active,distance=..20]
execute positioned 0 -64 0 run tp @a[team=Lobby,distance=18..,scores={isOpped=0}] ~ ~5 ~ 180.1 0.1
execute positioned 0 -64 0 run tp @a[team=Victory,distance=18..,scores={isOpped=0}] ~ ~5 ~ 180.1 0.1
execute positioned 0 -64 0 if score GameStarted GameState matches 1 unless entity @a[team=Active] run function stl:load
kill @e[type=item]
execute as @a[team=Active] if score @s Height > @s MaxHeight run scoreboard players operation @s MaxHeight = @s Height

#Spawn protection \/
execute positioned 0 -64 0 if score GameStarted GameState matches 1 run fill -1 -62 -1 1 -60 1 air replace

#Repeat \/
schedule function stl:maintick 10t