execute as @a run scoreboard players add @e[tag=Setup] online 1
execute as @e[tag=Setup,scores={isCounting=1}] run tellraw @p {"text": "Already started!","color": "#de4343"}
execute as @e[tag=Setup,scores={online=2..,isCounting=0}] run function stl:countstart
execute as @e[tag=Setup,scores={online=..1,isCounting=0}] run tellraw @a {"text": "Not enough players to start the game!","color": "#de4343"}
scoreboard players set @e[tag=Setup] online 0