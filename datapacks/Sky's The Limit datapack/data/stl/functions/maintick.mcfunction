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

execute as @a[team=Active,scores={blockColor=28}] store result score @s BlockCount run clear @s minecraft:stone 0
execute as @a[team=Active,scores={blockColor=29}] store result score @s BlockCount run clear @s minecraft:cobblestone 0
execute as @a[team=Active,scores={blockColor=30}] store result score @s BlockCount run clear @s minecraft:granite 0
execute as @a[team=Active,scores={blockColor=31}] store result score @s BlockCount run clear @s minecraft:polished_granite 0
execute as @a[team=Active,scores={blockColor=32}] store result score @s BlockCount run clear @s minecraft:andesite 0
execute as @a[team=Active,scores={blockColor=33}] store result score @s BlockCount run clear @s minecraft:polished_andesite 0
execute as @a[team=Active,scores={blockColor=34}] store result score @s BlockCount run clear @s minecraft:diorite 0
execute as @a[team=Active,scores={blockColor=35}] store result score @s BlockCount run clear @s minecraft:polished_diorite 0
execute as @a[team=Active,scores={blockColor=36}] store result score @s BlockCount run clear @s minecraft:stone_bricks 0
execute as @a[team=Active,scores={blockColor=37}] store result score @s BlockCount run clear @s minecraft:mossy_stone_bricks 0
execute as @a[team=Active,scores={blockColor=38}] store result score @s BlockCount run clear @s minecraft:cracked_stone_bricks 0
execute as @a[team=Active,scores={blockColor=39}] store result score @s BlockCount run clear @s minecraft:chiseled_stone_bricks 0
execute as @a[team=Active,scores={blockColor=40}] store result score @s BlockCount run clear @s minecraft:smooth_stone 0

execute as @a[team=Active,scores={blockColor=41}] store result score @s BlockCount run clear @s minecraft:smooth_quartz 0
execute as @a[team=Active,scores={blockColor=42}] store result score @s BlockCount run clear @s minecraft:chiseled_quartz_block 0
execute as @a[team=Active,scores={blockColor=43}] store result score @s BlockCount run clear @s minecraft:quartz_block 0
execute as @a[team=Active,scores={blockColor=44}] store result score @s BlockCount run clear @s minecraft:quartz_bricks 0
execute as @a[team=Active,scores={blockColor=45}] store result score @s BlockCount run clear @s minecraft:quartz_pillar 0
execute as @a[team=Active,scores={blockColor=46}] store result score @s BlockCount run clear @s minecraft:blackstone 0
execute as @a[team=Active,scores={blockColor=47}] store result score @s BlockCount run clear @s minecraft:polished_blackstone 0
execute as @a[team=Active,scores={blockColor=48}] store result score @s BlockCount run clear @s minecraft:chiseled_polished_blackstone 0
execute as @a[team=Active,scores={blockColor=49}] store result score @s BlockCount run clear @s minecraft:polished_blackstone_bricks 0
execute as @a[team=Active,scores={blockColor=50}] store result score @s BlockCount run clear @s minecraft:cracked_polished_blackstone_bricks 0
execute as @a[team=Active,scores={blockColor=51}] store result score @s BlockCount run clear @s minecraft:nether_bricks 0
execute as @a[team=Active,scores={blockColor=52}] store result score @s BlockCount run clear @s minecraft:cracked_nether_bricks 0
execute as @a[team=Active,scores={blockColor=53}] store result score @s BlockCount run clear @s minecraft:chiseled_nether_bricks 0
execute as @a[team=Active,scores={blockColor=54}] store result score @s BlockCount run clear @s minecraft:red_nether_bricks 0
execute as @a[team=Active,scores={blockColor=55}] store result score @s BlockCount run clear @s minecraft:basalt 0
execute as @a[team=Active,scores={blockColor=56}] store result score @s BlockCount run clear @s minecraft:polished_basalt 0
execute as @a[team=Active,scores={blockColor=57}] store result score @s BlockCount run clear @s minecraft:smooth_basalt 0

execute as @a[team=Active,scores={blockColor=58}] store result score @s BlockCount run clear @s minecraft:prismarine 0
execute as @a[team=Active,scores={blockColor=59}] store result score @s BlockCount run clear @s minecraft:prismarine_bricks 0
execute as @a[team=Active,scores={blockColor=60}] store result score @s BlockCount run clear @s minecraft:dark_prismarine 0
execute as @a[team=Active,scores={blockColor=61}] store result score @s BlockCount run clear @s minecraft:bricks 0
execute as @a[team=Active,scores={blockColor=62}] store result score @s BlockCount run clear @s minecraft:sandstone 0
execute as @a[team=Active,scores={blockColor=63}] store result score @s BlockCount run clear @s minecraft:chiseled_sandstone 0
execute as @a[team=Active,scores={blockColor=64}] store result score @s BlockCount run clear @s minecraft:cut_sandstone 0
execute as @a[team=Active,scores={blockColor=65}] store result score @s BlockCount run clear @s minecraft:smooth_sandstone 0
execute as @a[team=Active,scores={blockColor=66}] store result score @s BlockCount run clear @s minecraft:red_sandstone 0
execute as @a[team=Active,scores={blockColor=67}] store result score @s BlockCount run clear @s minecraft:chiseled_red_sandstone 0
execute as @a[team=Active,scores={blockColor=68}] store result score @s BlockCount run clear @s minecraft:cut_red_sandstone 0
execute as @a[team=Active,scores={blockColor=69}] store result score @s BlockCount run clear @s minecraft:smooth_red_sandstone 0

#Give Blocks \/
execute as @a[team=Active,scores={BlockCount=..32}] run function stl:giveblock

#Checkpoint \/
execute positioned 0 -64 0 if score GameStarted GameState matches 1 if score CheckPointReached GameState matches 0 if entity @a[scores={Height=100..}] run function stl:checkpoint
execute positioned 0 -64 0 if score GameStarted GameState matches 1 if score CheckPointReached GameState matches 1 if entity @a[scores={Height=250..}] run function stl:checkpoint

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
execute positioned 0 -64 0 if score GameStarted GameState matches 1 run fill -3 -62 -3 -60 5 3 air replace

#Repeat \/
schedule function stl:maintick 10t