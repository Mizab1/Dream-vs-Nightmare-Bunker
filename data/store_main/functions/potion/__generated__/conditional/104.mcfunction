#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add potion_c private 1
playsound minecraft:block.dispenser.dispense master @a -42 67 87 1 1
function store_main:potion/display
scoreboard players set #execute LANG_MC_INTERNAL 1