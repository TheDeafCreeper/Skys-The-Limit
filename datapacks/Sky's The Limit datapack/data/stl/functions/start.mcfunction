#Start game \/
scoreboard players set @a isSpectating 0
execute as @a at @s if block ~ ~-1 ~ minecraft:red_concrete run scoreboard players set @s isSpectating 1
scoreboard players set @a DisplayLevel 0
execute as @a unless score @s UnlockBasic matches 0.. run scoreboard players set @s UnlockBasic 1

#Pick block colors \/
scoreboard players set brng.system randomnummin 0
scoreboard players set brng.system randomnummax 29
execute as @a run function stl:blockcolor

scoreboard players set @e[tag=Setup] isGameStarted 1
worldborder set 25.1
team join Active @a[scores={isSpectating=0}]
team join Spectator @a[scores={isSpectating=1}]
scoreboard objectives setdisplay sidebar Height
effect clear @a
execute at @e[tag=Setup] run playsound entity.experience_orb.pickup ambient @a ~ ~ ~
scoreboard players set @a isInGame 1

#TNT arrows \/
item replace entity @a[team=Active] hotbar.7 with minecraft:arrow 64
item replace entity @a[team=Active] hotbar.8 with minecraft:tipped_arrow{Potion:"minecraft:harming",display:{Name:"{\"text\":\"TNT Arrow\"}"}} 3

# Initial Inventory \/
item replace entity @a[team=Active] hotbar.0 with minecraft:stone_sword{Enchantments:[{id:"minecraft:knockback",lvl:3s}]}
item replace entity @a[team=Active] hotbar.1 with minecraft:iron_pickaxe{Enchantments:[{id:"minecraft:efficiency",lvl:3s}]}
item replace entity @a[team=Active] hotbar.2 with minecraft:bow{Enchantments:[{id:"minecraft:punch",lvl:2s},{id:"minecraft:infinity",lvl:1s}]}
item replace entity @a[team=Active] hotbar.4 with ender_pearl 16
item replace entity @a[team=Active] hotbar.6 with ladder 8

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

#Clear start area \/
execute at @e[tag=Setup] run fill ~16 ~ ~16 ~-16 ~16 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 ~16 ~16 ~-16 ~32 ~-16 air replace
execute at @e[tag=Setup] run fill ~-6 ~-1 ~-2 ~-7 ~-1 ~2 dirt replace
execute at @e[tag=Setup] run fill ~-6 ~-1 ~-6 ~-7 ~-1 ~-7 dirt replace
execute at @e[tag=Setup] run fill ~-8 ~-1 ~-1 ~-8 ~-1 ~1 polished_andesite replace
kill @e[type=item]
kill @e[type=armor_stand]