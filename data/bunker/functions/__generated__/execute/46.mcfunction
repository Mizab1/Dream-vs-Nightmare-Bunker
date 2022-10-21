#built using mc-build (https://github.com/mc-build/mc-build)

particle dust_color_transition 1.000 0.996 0.929 1 1.000 1.000 0.039 ^-0.5 ^-0.1 ^0.2 0 0 0 0 1 normal
execute as @e[tag=enemy, distance=..2] at @s run function bunker:__generated__/execute/47
execute if block ~ ~ ~ #bunker:bullet_passable unless entity @e[tag=enemy, distance=..2] positioned ^ ^ ^1 run function bunker:__generated__/execute/46