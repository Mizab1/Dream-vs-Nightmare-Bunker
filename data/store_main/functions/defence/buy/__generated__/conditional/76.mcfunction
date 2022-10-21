#built using mc-build (https://github.com/mc-build/mc-build)

function store:defence/firework
scoreboard players remove @s point 30
playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
scoreboard players set #execute LANG_MC_INTERNAL 1