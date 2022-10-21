#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players set #execute LANG_MC_INTERNAL 0
execute if score @s point matches 25.. run function store_main:potion/buy/__generated__/conditional/112
execute if score #execute LANG_MC_INTERNAL matches 0 run function store_main:potion/buy/__generated__/conditional/113