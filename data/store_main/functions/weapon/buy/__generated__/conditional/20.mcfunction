#built using mc-build (https://github.com/mc-build/mc-build)

function store:weapon/airstrike
scoreboard players remove @s point 20
playsound minecraft:entity.arrow.hit_player master @a -42 67 89 1 1.2
scoreboard players set #execute LANG_MC_INTERNAL 1