#built using mc-build (https://github.com/mc-build/mc-build)

execute as @e[type=armor_stand,tag=stalagmite_as,tag=stalagmite_wait,scores={stalagmite_wait=60}] at @s run function bunker:withdraw_stalagmite
scoreboard players set @e[type=armor_stand,tag=stalagmite_as,tag=stalagmite_wait,scores={stalagmite_wait=60}] stalagmite_wait 0
tag @e[type=armor_stand,tag=stalagmite_as,tag=stalagmite_wait,scores={stalagmite_wait=60}] remove stalagmite_wait