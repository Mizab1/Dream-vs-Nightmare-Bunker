#built using mc-build (https://github.com/mc-build/mc-build)

schedule function bunker:__generated__/clock/2 10s
tag @e[tag=enemy, tag=firework_ytber] remove firework_ytber
tag @e[tag=enemy, tag=stripped] remove stripped
tag @e[tag=enemy, tag=stepped_on_portal] remove stepped_on_portal
effect give @e[type=zombie, tag=herobrine] levitation 3 2 true
effect give @e[type=zombie, tag=herobrine] resistance 3 7 true
execute as @e[type=zombie, tag=blinding_zombie] at @s run effect give @a[distance=..4] blindness 4 1 true
execute as @a at @s if entity @e[tag=can_radiate, distance=..4] run effect give @s poison 10 0 true
execute at @e[tag=can_radiate] run function bunker:__generated__/execute/8