#built using mc-build (https://github.com/mc-build/mc-build)

particle dust 0.400 0.478 0.447 1 ^-0.3 ^-0.3 ^0.2 0 0 0 1 1 normal
execute as @e[tag=enemy, dx=0] at @s run function bunker:__generated__/execute/57
execute if block ~ ~ ~ #bunker:bullet_passable unless entity @e[tag=enemy, dx=0] positioned ^ ^ ^1 run function bunker:__generated__/execute/56