#Scoreboards \/
scoreboard objectives add GameState dummy
scoreboard players set FirstTo100 GameState 0
scoreboard players set FirstTo200 GameState 0
scoreboard players set CheckPointReached GameState 0
scoreboard players set GameStarted GameState 0
scoreboard players set Countdown GameState -1
scoreboard players set Online GameState 0

scoreboard objectives add Height dummy
scoreboard players set @a Height 0

scoreboard objectives add Leaderboard dummy
scoreboard players add @a Leaderboard 0
scoreboard objectives modify Leaderboard displayname {"text":"Leaderboard","color":"blue"}

scoreboard objectives add WeeklyLB dummy
scoreboard players add @a WeeklyLB 0
scoreboard objectives setdisplay sidebar WeeklyLB
scoreboard objectives modify WeeklyLB displayname {"text":"Weekly Leaderboard","color":"gold"}

scoreboard objectives add isOpped dummy

scoreboard objectives add blockColor dummy
scoreboard players set @a blockColor 0

scoreboard objectives add Kills dummy
scoreboard players set @a Kills 0

scoreboard objectives add MaxHeight dummy
scoreboard players set @a MaxHeight 0

scoreboard objectives add DisplayLevel dummy
scoreboard players set @a DisplayLevel 0

scoreboard objectives add PearlCount dummy
scoreboard players set @a PearlCount 0

scoreboard objectives add BlockCount dummy
scoreboard players set @a BlockCount 0

#Teams \/
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
execute positioned 0 -64 0 run tp @a ~ ~3 ~ 180.1 0.1
execute positioned 0 -64 0 run setworldspawn ~ ~3 ~

#When used as reset \/
execute positioned 0 -64 0 run fill ~16 -64 ~16 ~-16 -48 ~-16 air
execute positioned 0 -64 0 run fill ~16 -48 ~16 ~-16 -32 ~-16 air
execute positioned 0 -64 0 run fill ~16 -32 ~16 ~-16 -16 ~-16 air
execute positioned 0 -64 0 run fill ~16 -16 ~16 ~-16 0 ~-16 air
execute positioned 0 -64 0 run fill ~16 0 ~16 ~-16 16 ~-16 air
execute positioned 0 -64 0 run fill ~16 16 ~16 ~-16 32 ~-16 air
execute positioned 0 -64 0 run fill ~16 32 ~16 ~-16 48 ~-16 air
execute positioned 0 -64 0 run fill ~16 48 ~16 ~-16 64 ~-16 air
execute positioned 0 -64 0 run fill ~16 64 ~16 ~-16 80 ~-16 air
execute positioned 0 -64 0 run fill ~16 80 ~16 ~-16 96 ~-16 air
execute positioned 0 -64 0 run fill ~16 96 ~16 ~-16 112 ~-16 air
execute positioned 0 -64 0 run fill ~16 112 ~16 ~-16 128 ~-16 air
execute positioned 0 -64 0 run fill ~16 128 ~16 ~-16 144 ~-16 air
execute positioned 0 -64 0 run fill ~16 144 ~16 ~-16 160 ~-16 air
execute positioned 0 -64 0 run fill ~16 160 ~16 ~-16 176 ~-16 air
execute positioned 0 -64 0 run fill ~16 176 ~16 ~-16 192 ~-16 air
execute positioned 0 -64 0 run fill ~16 192 ~16 ~-16 208 ~-16 air
execute positioned 0 -64 0 run fill ~16 208 ~16 ~-16 224 ~-16 air
execute positioned 0 -64 0 run fill ~16 224 ~16 ~-16 240 ~-16 air
execute positioned 0 -64 0 run fill ~16 240 ~16 ~-16 256 ~-16 air
execute positioned 0 -64 0 run fill ~16 256 ~16 ~-16 272 ~-16 air
execute positioned 0 -64 0 run fill ~16 272 ~16 ~-16 288 ~-16 air
execute positioned 0 -64 0 run fill ~16 288 ~16 ~-16 304 ~-16 air
execute positioned 0 -64 0 run fill ~16 304 ~16 ~-16 319 ~-16 air

kill @e[type=item]
kill @e[type=arrow]

kill @e[type=marker,tag=!Setup]
execute positioned 0 -64 0 run setblock ~ ~2 ~ minecraft:structure_block{metadata:"",mirror:"NONE",ignoreEntities:0b,powered:0b,seed:0L,author:"Corteszx",rotation:"NONE",posX:-8,mode:"LOAD",posY:0,sizeX:17,posZ:-8,integrity:1.0f,showair:0b,name:"minecraft:arena_platform",id:"minecraft:structure_block",sizeY:15,sizeZ:17,showboundingbox:0b}
execute positioned 0 -64 0 run setblock ~ ~1 ~ redstone_block

playsound block.note_block.pling ambient @a ~ ~ ~ 1

#Schedule \/
schedule function stl:maintick 10t
schedule function stl:leavecondition 20t
schedule function stl:blockcolor 20t