#built using mc-build (https://github.com/mc-build/mc-build)

execute rotated ~ 0 run tp @s ^ ^ ^0.15 facing entity @e[type=villager,tag=hostage,limit=1]
execute if block ~ ~-0.05 ~ air run tp @s ~ ~-0.05 ~