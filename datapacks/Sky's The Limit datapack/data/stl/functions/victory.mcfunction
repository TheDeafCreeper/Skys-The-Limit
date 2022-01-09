#Victory! \/
execute as @a[team=Active] run tellraw @s [{"text":"You got to Y"},{"score":{"name":"@s","objective":"MaxHeight"}},{"text":" with "},{"score":{"name":"@s","objective":"Kills"},"color":"red","bold":true},{"text":" kills!","color":"white","bold":false}]
team join Victory @s
function stl:load
say has constructed the tallest tower!
scoreboard players add @s Leaderboard 1
scoreboard players add @s WeeklyLB 1

#Fireworks \/
schedule function stl:fireworks 20t
execute at @a[team=Victory] run summon firework_rocket ~-5 ~ ~2 {LifeTime:20,FireworksItem:{id:"firework_rocket",Count:1,tag:{Fireworks:{Flight:2,Explosions:[{Type:4,Flicker:1,Trail:1,Colors:[I;14602026],FadeColors:[I;11743532]}]}}}}
execute at @a[team=Victory] run summon firework_rocket ~3 ~1 ~-1 {LifeTime:30,FireworksItem:{id:"firework_rocket",Count:1,tag:{Fireworks:{Flight:3,Explosions:[{Type:1,Flicker:0,Trail:1,Colors:[I;2437522],FadeColors:[I;8073150]}]}}}}