#built using mc-build (https://github.com/mc-build/mc-build)

particle dust 1 0 0.000 1 ^-0.3 ^-0.3 ^0.2 0 0 0 10 0 normal
execute as @e[tag=enemy, dx=0] at @s run function bunker:__generated__/execute/53
execute if block ~ ~ ~ #bunker:bullet_passable unless entity @e[tag=enemy, dx=0] positioned ^ ^ ^1 run function bunker:__generated__/execute/52