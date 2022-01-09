execute if score CheckPointReached GameState matches 0 positioned 0 -1 0 run setblock ~-14 ~ ~-14 minecraft:structure_block{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Corteszx", rotation: "NONE", posX: 0, mode: "LOAD", posY: 1, sizeX: 29, posZ: 0, integrity: 1.0f, showair: 0b, name: "minecraft:checkpoint", id: "minecraft:structure_block", sizeY: 1, sizeZ: 29, showboundingbox: 0b}
execute if score CheckPointReached GameState matches 0 positioned 0 -1 0 run setblock ~-14 ~ ~-13 minecraft:redstone_block

execute if score CheckPointReached GameState matches 1 positioned 0 49 0 run setblock ~-14 ~ ~-14 minecraft:structure_block{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Corteszx", rotation: "NONE", posX: 0, mode: "LOAD", posY: 1, sizeX: 29, posZ: 0, integrity: 1.0f, showair: 0b, name: "minecraft:checkpoint", id: "minecraft:structure_block", sizeY: 1, sizeZ: 29, showboundingbox: 0b}
execute if score CheckPointReached GameState matches 1 positioned 0 49 0 run setblock ~-14 ~ ~-13 minecraft:redstone_block
#execute if score CheckPointReached GameState matches 0 run setworldspawn 0 51 11

execute if score CheckPointReached GameState matches 2 positioned 0 99 0 run setblock ~-14 ~ ~-14 minecraft:structure_block{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Corteszx", rotation: "NONE", posX: 0, mode: "LOAD", posY: 1, sizeX: 29, posZ: 0, integrity: 1.0f, showair: 0b, name: "minecraft:checkpoint", id: "minecraft:structure_block", sizeY: 1, sizeZ: 29, showboundingbox: 0b}
execute if score CheckPointReached GameState matches 2 positioned 0 99 0 run setblock ~-14 ~ ~-13 minecraft:redstone_block

execute if score CheckPointReached GameState matches 3 positioned 0 149 0 run setblock ~-14 ~ ~-14 minecraft:structure_block{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Corteszx", rotation: "NONE", posX: 0, mode: "LOAD", posY: 1, sizeX: 29, posZ: 0, integrity: 1.0f, showair: 0b, name: "minecraft:checkpoint", id: "minecraft:structure_block", sizeY: 1, sizeZ: 29, showboundingbox: 0b}
execute if score CheckPointReached GameState matches 3 positioned 0 149 0 run setblock ~-14 ~ ~-13 minecraft:redstone_block

execute if score CheckPointReached GameState matches 4 positioned 0 199 0 run setblock ~-14 ~ ~-14 minecraft:structure_block{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Corteszx", rotation: "NONE", posX: 0, mode: "LOAD", posY: 1, sizeX: 29, posZ: 0, integrity: 1.0f, showair: 0b, name: "minecraft:checkpoint", id: "minecraft:structure_block", sizeY: 1, sizeZ: 29, showboundingbox: 0b}
execute if score CheckPointReached GameState matches 4 positioned 0 199 0 run setblock ~-14 ~ ~-13 minecraft:redstone_block

execute if score CheckPointReached GameState matches 5 positioned 0 249 0 run setblock ~-14 ~ ~-14 minecraft:structure_block{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Corteszx", rotation: "NONE", posX: 0, mode: "LOAD", posY: 1, sizeX: 29, posZ: 0, integrity: 1.0f, showair: 0b, name: "minecraft:checkpoint", id: "minecraft:structure_block", sizeY: 1, sizeZ: 29, showboundingbox: 0b}
execute if score CheckPointReached GameState matches 5 positioned 0 249 0 run setblock ~-14 ~ ~-13 minecraft:redstone_block

#execute if score CheckPointReached GameState matches 1 run setworldspawn 0 201 11

scoreboard players add CheckPointReached GameState 1