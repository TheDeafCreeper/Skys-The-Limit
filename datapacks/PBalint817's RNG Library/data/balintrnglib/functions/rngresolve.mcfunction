scoreboard players operation brng.system rngoperator4 = brng.system randomnummax
scoreboard players operation brng.system rngoperator4 -= brng.system randomnummin
scoreboard players operation brng.system rngoperator4 -= brng.system rngoperator1
execute if score brng.system rngoperator4 matches ..-1 run scoreboard players operation brng.system rngoperator4 *= brng.system rngoperator1

execute if score brng.system rngoperator2 matches ..-1 run scoreboard players operation brng.system rngoperator2 *= brng.system rngoperator1

scoreboard players operation brng.system rngoperator3 = brng.system rngoperator2

scoreboard players operation brng.system rngoperator5 = brng.system randomnummin
scoreboard players operation brng.system rngoperator2 %= brng.system rngoperator4

scoreboard players set brng.system rngoperator1 1
execute if predicate balintrnglib:random50chance run scoreboard players set brng.system rngoperator1 0
execute if score brng.system rngoperator1 matches 0 run scoreboard players operation brng.system rngoperator5 += brng.system rngoperator2
execute if score brng.system rngoperator1 matches 1 run scoreboard players operation brng.system rngoperator5 = brng.system randomnummax
execute if score brng.system rngoperator1 matches 1 run scoreboard players operation brng.system rngoperator5 -= brng.system rngoperator2

scoreboard players operation brng.system rngoperator2 = brng.system rngoperator5