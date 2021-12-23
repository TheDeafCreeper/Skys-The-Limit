execute if predicate balintrnglib:random50chance run scoreboard players operation brng.system rngoperator2 += brng.system rngoperator1
scoreboard players operation brng.system rngoperator1 /= brng.system rngoperator3
execute if predicate balintrnglib:random5chance run scoreboard players operation brng.system rngoperator1 /= brng.system rngoperator3

execute if score brng.system rngoperator1 matches 1.. run function balintrnglib:rngloop