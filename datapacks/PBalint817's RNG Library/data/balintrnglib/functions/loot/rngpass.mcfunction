scoreboard players set brng.system rngoperator2 0
scoreboard players set brng.system rngoperator3 0
scoreboard players set brng.system rngoperator4 0
scoreboard players set brng.system rngoperator5 0
scoreboard players set brng.system rngoutput 0

loot spawn 0 0 0 loot balintrnglib:random
execute store result score brng.system rngoperator2 run data get entity @e[type=item,limit=1,nbt={Item:{tag:{brng:"stew"}}}] Item.tag.Effects[0].EffectDuration
kill @e[type=item,nbt={Item:{tag:{brng:"stew"}}},limit=2]

scoreboard players set brng.system rngoperator1 -1

execute if score brng.system rngoperator2 < brng.system randomnummin run function balintrnglib:loot/rngresolve
execute if score brng.system rngoperator2 > brng.system randomnummax run function balintrnglib:loot/rngresolve

scoreboard players operation brng.system rngoutput = brng.system rngoperator2
