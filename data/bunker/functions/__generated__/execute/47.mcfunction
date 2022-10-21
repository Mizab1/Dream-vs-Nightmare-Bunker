#built using mc-build (https://github.com/mc-build/mc-build)

bossbar add converting "Converting"
bossbar set minecraft:converting max 20
bossbar set minecraft:converting players @a
particle falling_dust yellow_concrete ~ ~1 ~ .5 .5 .5 1 20 normal
tag @s add shot
schedule function bunker:__generated__/schedule/4 10t replace
scoreboard players add @s capture_time 1
schedule function bunker:__generated__/schedule/5 1s replace