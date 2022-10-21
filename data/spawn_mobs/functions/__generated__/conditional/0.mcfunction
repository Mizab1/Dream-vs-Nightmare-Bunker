#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players operation temp0 rng = state rng
scoreboard players operation temp0 rng *= a rng
scoreboard players operation temp0 rng += c rng
scoreboard players operation temp0 rng %= m rng
scoreboard players operation state rng = temp0 rng
scoreboard players operation rng rng_score = temp0 rng
scoreboard players operation rng rng_score /= #100000 rng
scoreboard players set min rng 1
scoreboard players set max rng 5
scoreboard players operation size rng = max rng
scoreboard players operation size rng -= min rng
scoreboard players operation rng rng_score %= size rng
scoreboard players operation rng rng_score += min rng
scoreboard players set #execute LANG_MC_INTERNAL 0
execute if score rng rng_score matches 1..2 run function spawn_mobs:__generated__/conditional/1
execute if score #execute LANG_MC_INTERNAL matches 0 if score rng rng_score matches 3 run function spawn_mobs:__generated__/conditional/2
execute if score #execute LANG_MC_INTERNAL matches 0 if score rng rng_score matches 4 run function spawn_mobs:__generated__/conditional/3
scoreboard players set #execute LANG_MC_INTERNAL 1