#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players set #execute LANG_MC_INTERNAL 0
execute as @s[tag=have_leather_helmet] run function bunker:__generated__/conditional/15
execute if score #execute LANG_MC_INTERNAL matches 0 as @s[tag=have_iron_helmet] run function bunker:__generated__/conditional/16
execute if score #execute LANG_MC_INTERNAL matches 0 as @s[tag=have_diamond_helmet] run function bunker:__generated__/conditional/17
execute if score #execute LANG_MC_INTERNAL matches 0 as @s[tag=have_netherite_helmet] run function bunker:__generated__/conditional/18
execute if score #execute LANG_MC_INTERNAL matches 0 run function bunker:__generated__/conditional/19