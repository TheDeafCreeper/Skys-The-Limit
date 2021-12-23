#Setup \/
kill @e[type=marker]
summon marker ~ ~ ~ {Tags:["Setup"]}
execute at @e[tag=Setup] run summon leash_knot ~ 5 ~
tp @e[tag=Setup] @e[type=leash_knot,limit=1]
execute at @e[tag=Setup] run setworldspawn
scoreboard players set @e[tag=Setup] isGameStarted 0
execute at @e[tag=Setup] run worldborder center ~ ~
worldborder set 500 5

#Platform detail \/
kill @e[type=marker,tag=!Setup]
execute at @e[tag=Setup] run setblock ~ ~-1 ~ minecraft:structure_block{metadata:"",mirror:"NONE",ignoreEntities:0b,powered:0b,seed:0L,author:"Corteszx",rotation:"NONE",posX:-8,mode:"LOAD",posY:0,sizeX:17,posZ:-8,integrity:1.0f,showair:0b,name:"minecraft:arena_platform",id:"minecraft:structure_block",sizeY:15,sizeZ:17,showboundingbox:0b}
execute at @e[tag=Setup] run setblock ~ ~-2 ~ redstone_block