#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players remove weapon_c private 1
playsound minecraft:block.dispenser.dispense master @a -42 67 89 1 1.2
function store_main:weapon/display
scoreboard players set #execute LANG_MC_INTERNAL 1