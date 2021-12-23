loot spawn 0 0 0 loot balintrnglib:random
execute unless score brng.system forceloadrng matches 0 run execute store result score brng.system rngoutput run data get entity @e[type=item,limit=1,nbt={Item:{tag:{brng:"stew"}}}] Item.tag.Effects[0].EffectDuration
kill @e[type=item,nbt={Item:{tag:{brng:"stew"}}},limit=2]