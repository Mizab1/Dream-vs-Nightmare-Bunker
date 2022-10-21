#built using mc-build (https://github.com/mc-build/mc-build)

clone -56 106 222 -38 122 222 -49 79 157
tp @e[tag=enemy] ~ ~-600 ~
tp @e[tag=decoration_bat] ~ ~-600 ~
scoreboard players set start private 0
effect give @a blindness 3 1 true
execute as @a at @s run playsound minecraft:entity.guardian.death master @s ~ ~ ~ 1 0.4
title @a title {"text": "Game Over","color": "red"}
title @a subtitle {"text": "The Hostage has been Killed","color": "green"}
schedule function bunker:__generated__/schedule/0 30t append