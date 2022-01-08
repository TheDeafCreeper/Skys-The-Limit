#Scoreboards \/
scoreboard objectives add isGameStarted dummy
scoreboard players set @e[tag=Setup] isGameStarted 0
scoreboard objectives add cpReached dummy
scoreboard players set @e[tag=Setup] cpReached 0

scoreboard objectives add isInGame dummy

scoreboard objectives add Height dummy
scoreboard objectives add Leaderboard dummy
scoreboard players add @a Leaderboard 0
scoreboard objectives setdisplay sidebar Leaderboard
scoreboard players set @a Height 0
scoreboard objectives add isOpped dummy
scoreboard players set @a[name=!"Corteszx",name=!"TheDeafCreeper"] isOpped 0
scoreboard objectives add countdown dummy
scoreboard players set @e[tag=Setup] countdown -1
scoreboard objectives add Time dummy
scoreboard objectives add isSpectating dummy
scoreboard players set @a isSpectating 0
scoreboard objectives add online dummy
scoreboard players set @e[tag=Setup] online 0
scoreboard objectives add isCounting dummy
scoreboard players set @e[tag=Setup] isCounting 0
scoreboard objectives add hasLeft custom:minecraft.leave_game
scoreboard players set @a hasLeft 0
scoreboard objectives add blockColor dummy
scoreboard players set @a blockColor 0
scoreboard objectives add Kills dummy
scoreboard players reset * Kills
scoreboard players set @a Kills 0
scoreboard objectives add MaxHeight dummy
scoreboard players reset * MaxHeight
scoreboard players set @a MaxHeight 0
scoreboard players reset * isInGame

scoreboard objectives modify Leaderboard displayname {"text":"Leaderboard","color":"blue"}

#Teams \/
team add Setup
team add Lobby
team add Active
team add Spectator
team add Victory

team modify Victory color gold
team modify Lobby color white
team modify Active color green
team modify Spectator color yellow

team empty Active
team empty Spectator

#Bossbar \/
bossbar add countdown "Starting.."
bossbar set countdown color green
bossbar set countdown max 10
bossbar set countdown value 10
bossbar set countdown style notched_10
bossbar set countdown players

#Misc \/
effect clear @a
difficulty easy
kill @e[type=!player,type=!marker]
worldborder set 500 5
worldborder damage amount 10
worldborder damage buffer 0
gamerule mobGriefing true
gamerule doMobSpawning false
gamerule doDaylightCycle false
gamerule commandBlockOutput false
gamerule doWeatherCycle false
gamerule doImmediateRespawn true
gamerule keepInventory true
time set noon
execute at @e[tag=Setup] positioned ~ ~ ~ run tp @a ~ ~ ~ 180.1 0.1
execute at @e[tag=Setup] run setworldspawn ~ ~ ~

#When used as reset \/
execute at @e[tag=Setup] run fill ~16 -64 ~16 ~-16 -48 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 -48 ~16 ~-16 0 ~-32 air replace
execute at @e[tag=Setup] run fill ~16 -32 ~16 ~-16 -16 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 -16 ~16 ~-16 0 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 0 ~16 ~-16 16 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 16 ~16 ~-16 32 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 32 ~16 ~-16 48 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 48 ~16 ~-16 64 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 64 ~16 ~-16 80 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 80 ~16 ~-16 96 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 96 ~16 ~-16 112 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 112 ~16 ~-16 128 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 128 ~16 ~-16 144 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 144 ~16 ~-16 160 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 160 ~16 ~-16 176 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 176 ~16 ~-16 192 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 192 ~16 ~-16 208 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 208 ~16 ~-16 224 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 224 ~16 ~-16 240 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 240 ~16 ~-16 256 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 256 ~16 ~-16 272 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 272 ~16 ~-16 288 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 288 ~16 ~-16 304 ~-16 air replace
execute at @e[tag=Setup] run fill ~16 304 ~16 ~-16 320 ~-16 air replace

kill @e[type=item]
kill @e[type=arrow]

kill @e[type=marker,tag=!Setup]
execute at @e[tag=Setup] run setblock ~ ~-1 ~ minecraft:structure_block{metadata:"",mirror:"NONE",ignoreEntities:0b,powered:0b,seed:0L,author:"Corteszx",rotation:"NONE",posX:-8,mode:"LOAD",posY:0,sizeX:17,posZ:-8,integrity:1.0f,showair:0b,name:"minecraft:arena_platform",id:"minecraft:structure_block",sizeY:15,sizeZ:17,showboundingbox:0b}
execute at @e[tag=Setup] run setblock ~ ~-2 ~ redstone_block

playsound block.note_block.pling ambient @a ~ ~ ~ 1

#Schedule \/
schedule function stl:maintick 10t
schedule function stl:leavecondition 20t
schedule function stl:blockcolor 20t