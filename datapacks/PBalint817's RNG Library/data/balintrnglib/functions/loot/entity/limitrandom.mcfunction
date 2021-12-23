# Aa.

scoreboard players set @s rngerrorcount 0

execute store success score @s rngerrorcheck run scoreboard players get @s randomnummin
execute if score @s rngerrorcheck matches 0 run scoreboard players set @s rngerrorcount 1
execute store success score @s rngerrorcheck run scoreboard players get @s randomnummax
execute if score @s rngerrorcheck matches 0 run scoreboard players set @s rngerrorcount 1

execute if score @s rngerrorcount matches 0 if score @s randomnummin > @s randomnummax run scoreboard players add @s rngerrorcount 1

execute if score brng.system forceloadrng matches 0 run scoreboard players set @s rngerrorcount 1

execute unless score @s rngerrorcount matches 0 run scoreboard players reset @s rngoutput
execute if score @s rngerrorcount matches 0 run function balintrnglib:loot/entity/rngpass