#Team management \/
execute as @e[tag=Setup,scores={isGameStarted=0}] run team join Lobby @a[team=!Lobby,team=!Victory]
execute as @e[tag=Setup,scores={isGameStarted=1}] run team join Active @a[team=Lobby]
execute as @e[tag=Setup,scores={isGameStarted=1}] run team join Spectator @a[team=!Active]
execute as @a[scores={isGameStarted=1,hasLeft=1..}] run team join Spectator @s

execute as @a[team=Lobby,scores={isOpped=0}] run gamemode adventure @s
execute as @a[team=Victory,scores={isOpped=0}] run gamemode adventure @s
execute as @a[team=Active,scores={isOpped=0}] run gamemode survival @s
execute as @a[team=Spectator,scores={isOpped=0}] run gamemode spectator @s

#Inventory Management \/
clear @a[team=Lobby,scores={isOpped=0}]
clear @a[team=Victory,scores={isOpped=0}]
clear @a[team=Spectator,scores={isOpped=0}]
item replace entity @a[team=Active] hotbar.0 with minecraft:stone_sword{Enchantments:[{id:"minecraft:knockback",lvl:3s}]}
item replace entity @a[team=Active] hotbar.2 with minecraft:bow{Enchantments:[{id:"minecraft:punch",lvl:2s},{id:"minecraft:infinity",lvl:1s}]}
item replace entity @a[team=Active] hotbar.1 with minecraft:iron_pickaxe{Enchantments:[{id:"minecraft:efficiency",lvl:3s}]}
item replace entity @a[team=Active] hotbar.4 with ender_pearl 1

#Item block color \/
item replace entity @a[team=Active,scores={blockColor=0}] hotbar.3 with minecraft:red_concrete 64
item replace entity @a[team=Active,scores={blockColor=1}] hotbar.3 with minecraft:orange_concrete 64
item replace entity @a[team=Active,scores={blockColor=2}] hotbar.3 with minecraft:yellow_concrete 64
item replace entity @a[team=Active,scores={blockColor=3}] hotbar.3 with minecraft:lime_concrete 64 
item replace entity @a[team=Active,scores={blockColor=4}] hotbar.3 with minecraft:green_concrete 64
item replace entity @a[team=Active,scores={blockColor=5}] hotbar.3 with minecraft:light_gray_concrete 64
item replace entity @a[team=Active,scores={blockColor=6}] hotbar.3 with minecraft:blue_concrete 64
item replace entity @a[team=Active,scores={blockColor=7}] hotbar.3 with minecraft:light_blue_concrete 64
item replace entity @a[team=Active,scores={blockColor=8}] hotbar.3 with minecraft:cyan_concrete 64
item replace entity @a[team=Active,scores={blockColor=9}] hotbar.3 with minecraft:pink_concrete 64
item replace entity @a[team=Active,scores={blockColor=10}] hotbar.3 with minecraft:purple_concrete 64
item replace entity @a[team=Active,scores={blockColor=11}] hotbar.3 with minecraft:gray_concrete 64
item replace entity @a[team=Active,scores={blockColor=12}] hotbar.3 with minecraft:black_concrete 64
item replace entity @a[team=Active,scores={blockColor=13}] hotbar.3 with minecraft:white_concrete 64
item replace entity @a[team=Active,scores={blockColor=14}] hotbar.3 with minecraft:red_terracotta 64
item replace entity @a[team=Active,scores={blockColor=15}] hotbar.3 with minecraft:orange_terracotta 64
item replace entity @a[team=Active,scores={blockColor=16}] hotbar.3 with minecraft:yellow_terracotta 64
item replace entity @a[team=Active,scores={blockColor=17}] hotbar.3 with minecraft:lime_terracotta 64 
item replace entity @a[team=Active,scores={blockColor=18}] hotbar.3 with minecraft:green_terracotta 64
item replace entity @a[team=Active,scores={blockColor=19}] hotbar.3 with minecraft:light_gray_terracotta 64
item replace entity @a[team=Active,scores={blockColor=20}] hotbar.3 with minecraft:blue_terracotta 64
item replace entity @a[team=Active,scores={blockColor=21}] hotbar.3 with minecraft:light_blue_terracotta 64
item replace entity @a[team=Active,scores={blockColor=22}] hotbar.3 with minecraft:cyan_terracotta 64
item replace entity @a[team=Active,scores={blockColor=23}] hotbar.3 with minecraft:pink_terracotta 64
item replace entity @a[team=Active,scores={blockColor=24}] hotbar.3 with minecraft:purple_terracotta 64
item replace entity @a[team=Active,scores={blockColor=25}] hotbar.3 with minecraft:gray_terracotta 64
item replace entity @a[team=Active,scores={blockColor=26}] hotbar.3 with minecraft:black_terracotta 64
item replace entity @a[team=Active,scores={blockColor=27}] hotbar.3 with minecraft:white_terracotta 64

#Premium Blocks Stone \/
item replace entity @a[team=Active,scores={blockColor=28}] hotbar.3 with minecraft:stone 64
item replace entity @a[team=Active,scores={blockColor=29}] hotbar.3 with minecraft:cobblestone 64
item replace entity @a[team=Active,scores={blockColor=30}] hotbar.3 with minecraft:granite 64
item replace entity @a[team=Active,scores={blockColor=31}] hotbar.3 with minecraft:polished_granite 64
item replace entity @a[team=Active,scores={blockColor=32}] hotbar.3 with minecraft:andesite 64
item replace entity @a[team=Active,scores={blockColor=33}] hotbar.3 with minecraft:polished_andesite 64
item replace entity @a[team=Active,scores={blockColor=34}] hotbar.3 with minecraft:diorite 64
item replace entity @a[team=Active,scores={blockColor=35}] hotbar.3 with minecraft:polished_diorite 64
item replace entity @a[team=Active,scores={blockColor=36}] hotbar.3 with minecraft:stone_bricks 64
item replace entity @a[team=Active,scores={blockColor=37}] hotbar.3 with minecraft:mossy_stone_bricks 64
item replace entity @a[team=Active,scores={blockColor=38}] hotbar.3 with minecraft:cracked_stone_bricks 64
item replace entity @a[team=Active,scores={blockColor=39}] hotbar.3 with minecraft:chiseled_stone_bricks 64
item replace entity @a[team=Active,scores={blockColor=40}] hotbar.3 with minecraft:smooth_stone 64

#Premium Blocks Nether \/
item replace entity @a[team=Active,scores={blockColor=41}] hotbar.3 with minecraft:smooth_quartz 64
item replace entity @a[team=Active,scores={blockColor=42}] hotbar.3 with minecraft:chiseled_quartz_block 64
item replace entity @a[team=Active,scores={blockColor=43}] hotbar.3 with minecraft:quartz_block 64
item replace entity @a[team=Active,scores={blockColor=44}] hotbar.3 with minecraft:quartz_bricks 64
item replace entity @a[team=Active,scores={blockColor=45}] hotbar.3 with minecraft:quartz_pillar 64
item replace entity @a[team=Active,scores={blockColor=46}] hotbar.3 with minecraft:blackstone 64
item replace entity @a[team=Active,scores={blockColor=47}] hotbar.3 with minecraft:polished_blackstone 64
item replace entity @a[team=Active,scores={blockColor=48}] hotbar.3 with minecraft:chiseled_polished_blackstone 64
item replace entity @a[team=Active,scores={blockColor=49}] hotbar.3 with minecraft:polished_blackstone_bricks 64
item replace entity @a[team=Active,scores={blockColor=50}] hotbar.3 with minecraft:cracked_polished_blackstone_bricks 64
item replace entity @a[team=Active,scores={blockColor=51}] hotbar.3 with minecraft:nether_bricks 64
item replace entity @a[team=Active,scores={blockColor=52}] hotbar.3 with minecraft:cracked_nether_bricks 64
item replace entity @a[team=Active,scores={blockColor=53}] hotbar.3 with minecraft:chiseled_nether_bricks 64
item replace entity @a[team=Active,scores={blockColor=54}] hotbar.3 with minecraft:red_nether_bricks 64
item replace entity @a[team=Active,scores={blockColor=55}] hotbar.3 with minecraft:basalt 64
item replace entity @a[team=Active,scores={blockColor=56}] hotbar.3 with minecraft:polished_basalt 64
item replace entity @a[team=Active,scores={blockColor=57}] hotbar.3 with minecraft:smooth_basalt 64

#Premium Blocks Misc \/
item replace entity @a[team=Active,scores={blockColor=58}] hotbar.3 with minecraft:prismarine 64
item replace entity @a[team=Active,scores={blockColor=59}] hotbar.3 with minecraft:prismarine_bricks 64
item replace entity @a[team=Active,scores={blockColor=60}] hotbar.3 with minecraft:dark_prismarine 64
item replace entity @a[team=Active,scores={blockColor=61}] hotbar.3 with minecraft:bricks 64
item replace entity @a[team=Active,scores={blockColor=62}] hotbar.3 with minecraft:sandstone 64
item replace entity @a[team=Active,scores={blockColor=63}] hotbar.3 with minecraft:chiseled_sandstone 64
item replace entity @a[team=Active,scores={blockColor=64}] hotbar.3 with minecraft:cut_sandstone 64
item replace entity @a[team=Active,scores={blockColor=65}] hotbar.3 with minecraft:smooth_sandstone 64
item replace entity @a[team=Active,scores={blockColor=66}] hotbar.3 with minecraft:red_sandstone 64
item replace entity @a[team=Active,scores={blockColor=67}] hotbar.3 with minecraft:chiseled_red_sandstone 64
item replace entity @a[team=Active,scores={blockColor=68}] hotbar.3 with minecraft:cut_red_sandstone 64
item replace entity @a[team=Active,scores={blockColor=69}] hotbar.3 with minecraft:smooth_red_sandstone 64

#Checkpoint \/
execute as @e[tag=Setup,scores={isGameStarted=1,cpReached=0}] if entity @a[scores={Height=100..}] run function stl:checkpoint
execute positioned 0 0 0 if entity @e[tag=Setup,scores={cpReached=1}] as @e[type=minecraft:ender_pearl,y=0,dy=50,x=-32,dx=64,z=-32,dz=64] run kill @s

#Victory \/
execute as @a[team=Active,scores={Height=256..}] run function stl:victory

#Misc
effect give @a[team=!Active] resistance 10 255 true
effect give @a[team=!Active] regeneration 10 255 true
effect give @a[team=!Active] weakness 10 255 true
execute at @e[tag=Setup] positioned ~ ~-25 ~ run kill @a[team=Active,distance=..20]
execute at @e[tag=Setup] run tp @a[team=Lobby,distance=18..,scores={isOpped=0}] ~ ~5 ~ 180.1 0.1
execute at @e[tag=Setup] run tp @a[team=Victory,distance=18..,scores={isOpped=0}] ~ ~5 ~ 180.1 0.1
execute if entity @e[tag=Setup,scores={isGameStarted=1}] unless entity @a[team=Active] run function stl:load
kill @e[type=item]
execute as @a[team=Active] if score @s Height > @s MaxHeight run scoreboard players operation @s MaxHeight = @s Height

#Spawn protection \/
execute at @e[tag=Setup,scores={isGameStarted=1}] run fill ~1 ~ ~1 ~-1 ~2 ~-1 air replace

#Set to Spectator on join \/
execute if entity @e[tag=Setup,scores={isGameStarted=1}] as @a unless score @s isInGame matches 1.. run team join Spectator @s
scoreboard players set @a isInGame 1

#Repeat \/
schedule function stl:maintick 10t