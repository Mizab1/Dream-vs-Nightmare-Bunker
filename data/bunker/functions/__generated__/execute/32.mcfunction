#built using mc-build (https://github.com/mc-build/mc-build)

particle end_rod ~ ~1 ~ 0.5 0.5 0.5 0.1 10 normal
scoreboard players set #execute LANG_MC_INTERNAL 0
execute if entity @s[type=#bunker:undead] run function bunker:__generated__/conditional/0
execute if score #execute LANG_MC_INTERNAL matches 0 run function bunker:__generated__/conditional/1