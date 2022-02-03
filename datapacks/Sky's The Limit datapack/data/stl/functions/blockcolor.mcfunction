scoreboard players set brng.system randomnummax 27
scoreboard players set brng.system randomnummin 0

function balintrnglib:limitrandom
scoreboard players operation @s blockColor = brng.system rngoutput