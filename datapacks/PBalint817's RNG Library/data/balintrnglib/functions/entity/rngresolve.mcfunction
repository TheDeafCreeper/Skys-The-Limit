scoreboard players operation @s rngoperator4 = @s randomnummax
scoreboard players operation @s rngoperator4 -= @s randomnummin
scoreboard players operation @s rngoperator4 -= @s rngoperator1
execute if score @s rngoperator4 matches ..-1 run scoreboard players operation @s rngoperator4 *= @s rngoperator1

execute if score @s rngoperator2 matches ..-1 run scoreboard players operation @s rngoperator2 *= @s rngoperator1

scoreboard players operation @s rngoperator3 = @s rngoperator2

scoreboard players operation @s rngoperator5 = @s randomnummin
scoreboard players operation @s rngoperator2 %= @s rngoperator4

scoreboard players set @s rngoperator1 1
execute if predicate balintrnglib:random50chance run scoreboard players set @s rngoperator1 0
execute if score @s rngoperator1 matches 0 run scoreboard players operation @s rngoperator5 += @s rngoperator2
execute if score @s rngoperator1 matches 1 run scoreboard players operation @s rngoperator5 = @s randomnummax
execute if score @s rngoperator1 matches 1 run scoreboard players operation @s rngoperator5 -= @s rngoperator2

scoreboard players operation @s rngoperator2 = @s rngoperator5