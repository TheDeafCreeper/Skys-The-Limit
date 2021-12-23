# This is the function you need to call to get any random number within the integer limit.

scoreboard players set brng.system rngoperator1 1073741824
scoreboard players set brng.system rngoperator2 0
scoreboard players set brng.system rngoperator3 2
scoreboard players set brng.system rngoutput 0

execute if predicate balintrnglib:random10chance run scoreboard players operation brng.system rngoperator1 /= brng.system rngoperator3

function balintrnglib:rngloop

scoreboard players set brng.system rngoperator1 -1
execute if predicate balintrnglib:random50chance run scoreboard players operation brng.system rngoperator2 *= brng.system rngoperator1

execute if score brng.system rngoperator2 matches ..-1 if predicate balintrnglib:random50chance run scoreboard players operation brng.system rngoperator2 += brng.system rngoperator1

scoreboard players operation brng.system rngoutput = brng.system rngoperator2