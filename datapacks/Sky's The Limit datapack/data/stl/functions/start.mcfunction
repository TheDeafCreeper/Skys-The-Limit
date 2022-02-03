#Start game \/
execute as @a at @s if block ~ ~-1 ~ minecraft:red_concrete run team join Spectator
scoreboard players reset * DisplayLevel
scoreboard players set @a DisplayLevel 0
execute as @a unless score @s UnlockBasic matches 0.. run scoreboard players set @s UnlockBasic 1
spawnpoint @a 0 -61 0
scoreboard players set @a CheckPoint 0

#Pick block colors \/
scoreboard players set brng.system randomnummin 0
scoreboard players set brng.system randomnummax 27
execute as @a run function stl:blockcolor

scoreboard players set GameStarted GameState 1

worldborder set 25.1

team join Active @a[team=!Spectator]

scoreboard objectives setdisplay sidebar DisplayLevel

effect clear @a

execute positioned 0 -64 0 run playsound entity.experience_orb.pickup ambient @a ~ ~ ~

#TNT arrows \/
item replace entity @a[team=Active] hotbar.7 with minecraft:arrow 64
item replace entity @a[team=Active] hotbar.8 with minecraft:tipped_arrow{Potion:"minecraft:harming",display:{Name:'{"text":"TNT Arrow"}'}} 3

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

#Clear start area \/
execute positioned 0 -64 0 run fill ~16 ~2 ~16 ~-16 ~16 ~-16 air replace
execute positioned 0 -64 0 run fill ~16 ~16 ~16 ~-16 ~32 ~-16 air replace
execute positioned 0 -64 0 run fill ~-6 ~-1 ~-2 ~-7 ~-1 ~2 dirt replace
execute positioned 0 -64 0 run fill ~-6 ~-1 ~-6 ~-7 ~-1 ~-7 dirt replace
execute positioned 0 -64 0 run fill ~-8 ~-1 ~-1 ~-8 ~-1 ~1 polished_andesite replace
kill @e[type=item]
kill @e[type=armor_stand]