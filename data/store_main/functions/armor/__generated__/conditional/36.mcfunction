#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add armor_c private 1
playsound minecraft:block.dispenser.dispense master @a -38 67 89 1 1
function store_main:armor/display
scoreboard players set #execute LANG_MC_INTERNAL 1