#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players operation temp0 rng = state rng
scoreboard players operation temp0 rng *= a rng
scoreboard players operation temp0 rng += c rng
scoreboard players operation temp0 rng %= m rng
scoreboard players operation state rng = temp0 rng
scoreboard players operation rng rng_score = temp0 rng
scoreboard players operation rng rng_score /= #100000 rng
scoreboard players set min rng 1
scoreboard players set max rng 18
scoreboard players operation size rng = max rng
scoreboard players operation size rng -= min rng
scoreboard players operation rng rng_score %= size rng
scoreboard players operation rng rng_score += min rng
scoreboard players set #execute LANG_MC_INTERNAL 0
execute if score rng rng_score matches 1..2 run function spawn_mobs:__generated__/conditional/5
execute if score #execute LANG_MC_INTERNAL matches 0 if score rng rng_score matches 3 run function spawn_mobs:__generated__/conditional/6
execute if score #execute LANG_MC_INTERNAL matches 0 if score rng rng_score matches 4 run function spawn_mobs:__generated__/conditional/7
scoreboard players set #execute LANG_MC_INTERNAL 0
execute if score rng rng_score matches 5 run function spawn_mobs:__generated__/conditional/8
execute if score #execute LANG_MC_INTERNAL matches 0 if score rng rng_score matches 6 run function spawn_mobs:__generated__/conditional/9
execute if score #execute LANG_MC_INTERNAL matches 0 if score rng rng_score matches 7 run function spawn_mobs:__generated__/conditional/10
execute if score #execute LANG_MC_INTERNAL matches 0 if score rng rng_score matches 8 run function spawn_mobs:__generated__/conditional/11
execute if score #execute LANG_MC_INTERNAL matches 0 if score rng rng_score matches 9 run function spawn_mobs:__generated__/conditional/12
execute if score #execute LANG_MC_INTERNAL matches 0 if score rng rng_score matches 10 run function spawn_mobs:__generated__/conditional/13
scoreboard players set #execute LANG_MC_INTERNAL 0
execute if score rng rng_score matches 11 run function spawn_mobs:__generated__/conditional/14
execute if score #execute LANG_MC_INTERNAL matches 0 if score rng rng_score matches 12 run function spawn_mobs:__generated__/conditional/15
execute if score #execute LANG_MC_INTERNAL matches 0 if score rng rng_score matches 13 run function spawn_mobs:__generated__/conditional/16
execute if score #execute LANG_MC_INTERNAL matches 0 if score rng rng_score matches 14 run function spawn_mobs:__generated__/conditional/17
execute if score #execute LANG_MC_INTERNAL matches 0 if score rng rng_score matches 15 run function spawn_mobs:__generated__/conditional/18
execute if score #execute LANG_MC_INTERNAL matches 0 if score rng rng_score matches 16 run function spawn_mobs:__generated__/conditional/19
execute if score #execute LANG_MC_INTERNAL matches 0 if score rng rng_score matches 17 run function spawn_mobs:__generated__/conditional/20
scoreboard players set #execute LANG_MC_INTERNAL 1