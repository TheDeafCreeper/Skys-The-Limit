scoreboard players set @s rngoperator1 1073741824
scoreboard players set @s rngoperator2 0
scoreboard players set @s rngoperator3 2
scoreboard players set @s rngoperator4 0
scoreboard players set @s rngoperator5 0
scoreboard players set @s rngoutput 0

execute if predicate balintrnglib:random10chance run scoreboard players operation @s rngoperator1 /= @s rngoperator3

function balintrnglib:entity/rngloop

scoreboard players set @s rngoperator1 -1
execute if score @s randomnummin matches ..-1 if predicate balintrnglib:random50chance run scoreboard players operation @s rngoperator2 *= @s rngoperator1

execute if score @s rngoperator2 matches ..-1 if score @s randomnummin matches ..-1 if predicate balintrnglib:random50chance run scoreboard players operation @s rngoperator2 += @s rngoperator1


execute if score @s rngoperator2 < @s randomnummin run function balintrnglib:entity/rngresolve
execute if score @s rngoperator2 > @s randomnummax run function balintrnglib:entity/rngresolve

scoreboard players operation @s rngoutput = @s rngoperator2
