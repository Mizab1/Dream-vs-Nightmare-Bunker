#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players set rng rng_score 0
scoreboard players set #execute LANG_MC_INTERNAL 0
execute if score Wave: stats matches 0..2 run function spawn_mobs:__generated__/conditional/0
execute if score #execute LANG_MC_INTERNAL matches 0 if score Wave: stats matches 3.. run function spawn_mobs:__generated__/conditional/4
scoreboard players remove mobsLeft mobs 1
execute if score mobsLeft mobs matches 1.. run function spawn_mobs:spawn
function spawn_mobs:steam_particles
execute at @e[type=zombie_villager, tag=enemy] run particle falling_dust lime_concrete ~ ~1.5 ~ 0.5 0.5 0.5 0.2 100 normal