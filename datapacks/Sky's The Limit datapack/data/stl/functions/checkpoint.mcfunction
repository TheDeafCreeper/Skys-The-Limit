execute at @e[tag=Setup] run setblock ~-14 50 ~-14 minecraft:structure_block{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Corteszx", rotation: "NONE", posX: 0, mode: "LOAD", posY: 1, sizeX: 29, posZ: 0, integrity: 1.0f, showair: 0b, name: "minecraft:checkpoint", id: "minecraft:structure_block", sizeY: 1, sizeZ: 29, showboundingbox: 0b}
execute at @e[tag=Setup] run setblock ~-14 50 ~-13 minecraft:redstone_block
execute at @e[tag=Setup] run setworldspawn ~ ~52 ~11
#tp @a[scores={Height=..52},team=Active] ~ ~52 ~11
scoreboard players set @e[tag=Setup] cpReached 1