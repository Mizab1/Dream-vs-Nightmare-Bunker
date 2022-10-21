#built using mc-build (https://github.com/mc-build/mc-build)

function store:weapon/arrow
scoreboard players remove @s point 1
playsound minecraft:entity.arrow.hit_player master @a -42 67 89 1 1.2
scoreboard players set #execute LANG_MC_INTERNAL 1