#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players remove defence_c private 1
playsound minecraft:block.dispenser.dispense master @a -38 67 87 1 1.2
function store_main:defence/display
scoreboard players set #execute LANG_MC_INTERNAL 1