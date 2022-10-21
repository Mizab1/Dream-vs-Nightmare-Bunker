#built using mc-build (https://github.com/mc-build/mc-build)

execute unless entity @e[type=villager,tag=hostage,distance=..15] run function bunker:__generated__/execute/17
execute if entity @e[type=villager,tag=hostage,distance=..15] run function bunker:__generated__/execute/20