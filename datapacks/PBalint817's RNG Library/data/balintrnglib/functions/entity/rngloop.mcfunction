execute if predicate balintrnglib:random50chance run scoreboard players operation @s rngoperator2 += @s rngoperator1
scoreboard players operation @s rngoperator1 /= @s rngoperator3
execute if predicate balintrnglib:random5chance run scoreboard players operation @s rngoperator1 /= @s rngoperator3

execute if score @s rngoperator1 matches 1.. run function balintrnglib:entity/rngloop