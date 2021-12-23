# Aa.

scoreboard players set brng.system rngerrorcount 0

execute store success score brng.system rngerrorcheck run scoreboard players get brng.system randomnummin
execute if score brng.system rngerrorcheck matches 0 run scoreboard players set brng.system rngerrorcount 1
execute store success score brng.system rngerrorcheck run scoreboard players get brng.system randomnummax
execute if score brng.system rngerrorcheck matches 0 run scoreboard players set brng.system rngerrorcount 1

execute if score brng.system rngerrorcount matches 0 if score brng.system randomnummin > brng.system randomnummax run scoreboard players add brng.system rngerrorcount 1

execute if score brng.system forceloadrng matches 0 run scoreboard players set brng.system rngerrorcount 1

execute unless score brng.system rngerrorcount matches 0 run scoreboard players reset brng.system rngoutput
execute if score brng.system rngerrorcount matches 0 run function balintrnglib:loot/rngpass