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
item replace entity @a[team=Active] hotbar.5 with minecraft:arrow 64
item replace entity @a[team=Active] hotbar.6 with minecraft:tipped_arrow{Potion:"minecraft:harming",display:{Name:"{\"text\":\"TNT Arrow\"}"}} 3

#Clear start area \/
execute at @e[tag=Setup] run fill ~16 ~ ~16 ~-16 ~16 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 ~ ~16 ~-16 ~32 ~-16 air replace
execute at @e[tag=Setup] run fill ~-6 ~-1 ~-2 ~-7 ~-1 ~2 dirt replace
execute at @e[tag=Setup] run fill ~-6 ~-1 ~-6 ~-7 ~-1 ~-7 dirt replace
execute at @e[tag=Setup] run fill ~-8 ~-1 ~-1 ~-8 ~-1 ~1 polished_andesite replace
kill @e[type=item]
kill @e[type=armor_stand]