# Same as "limitrandom", except that instead of using the scores of "brng.system", it uses the scores of the executing entity.

scoreboard players set @s rngerrorcount 0

execute store success score @s rngerrorcheck run scoreboard players get @s randomnummin
execute if score @s rngerrorcheck matches 0 run scoreboard players add @s rngerrorcount 1
execute store success score @s rngerrorcheck run scoreboard players get @s randomnummax
execute if score @s rngerrorcheck matches 0 run scoreboard players add @s rngerrorcount 2

execute if score @s rngerrorcount matches 0 if score @s randomnummin > @s randomnummax run scoreboard players add @s rngerrorcount 4


execute unless score @s rngerrorcount matches 0 run scoreboard players reset @s rngoutput
execute if score @s rngerrorcount matches 0 run function balintrnglib:entity/rngpass