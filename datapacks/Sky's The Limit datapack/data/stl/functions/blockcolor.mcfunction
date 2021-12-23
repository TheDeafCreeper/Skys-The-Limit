scoreboard players set brng.system randomnummax 27
scoreboard players set brng.system randomnummin 0


execute if score @s UnlockBasic matches 0 if score @s UnlockedStone matches 0 if score @s UnlockedNether matches 0 if score @s UnlockedMisc matches 0 run scoreboard players set @s UnlockBasic 1
execute if score @s UnlockBasic matches 0 run scoreboard players set brng.system randomnummin 28
execute if score @s UnlockedStone matches 1 run scoreboard players set brng.system randomnummax 40
execute if score @s UnlockedNether matches 1 run scoreboard players set brng.system randomnummax 57
execute if score @s UnlockedMisc matches 1 run scoreboard players set brng.system randomnummax 69

function balintrnglib:limitrandom
scoreboard players operation @s blockColor = brng.system rngoutput

execute if score @s SelectedBlock matches 0.. run scoreboard players operation @s blockColor = @s SelectedBlock
execute unless score @s SelectedBlock matches 0.. if score @s blockColor matches 0..27 unless score @s UnlockBasic matches 1 run function stl:blockcolor
execute unless score @s SelectedBlock matches 0.. if score @s blockColor matches 28..40 unless score @s UnlockedStone matches 1 run function stl:blockcolor
execute unless score @s SelectedBlock matches 0.. if score @s blockColor matches 41..57 unless score @s UnlockedNether matches 1 run function stl:blockcolor
execute unless score @s SelectedBlock matches 0.. if score @s blockColor matches 58..69 unless score @s UnlockedMisc matches 1 run function stl:blockcolor