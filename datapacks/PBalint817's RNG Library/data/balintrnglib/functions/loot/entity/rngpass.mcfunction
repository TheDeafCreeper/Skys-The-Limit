scoreboard players set @s rngoperator2 0
scoreboard players set @s rngoperator3 0
scoreboard players set @s rngoperator4 0
scoreboard players set @s rngoperator5 0
scoreboard players set @s rngoutput 0

loot spawn 0 0 0 loot balintrnglib:random
execute store result score @s rngoperator2 run data get entity @e[type=item,limit=1,nbt={Item:{tag:{brng:"stew"}}}] Item.tag.Effects[0].EffectDuration
kill @e[type=item,nbt={Item:{tag:{brng:"stew"}}},limit=2]

scoreboard players set @s rngoperator1 -1

execute if score @s rngoperator2 < @s randomnummin run function balintrnglib:loot/entity/rngresolve
execute if score @s rngoperator2 > @s randomnummax run function balintrnglib:loot/entity/rngresolve

scoreboard players operation @s rngoutput = @s rngoperator2
