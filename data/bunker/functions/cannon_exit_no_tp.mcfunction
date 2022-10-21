#built using mc-build (https://github.com/mc-build/mc-build)

effect clear @s slowness
effect clear @s invisibility
effect clear @s resistance
clear @s carrot_on_a_stick{CustomModelData:110011}
setblock -43 68 91 air
setblock -43 68 91 warped_wall_sign[facing=east]{Text1:'[{"text":"[ ","color":"gray","bold":true},{"text":"Cannon","color":"blue"},{"text":" ]"}]',Text3:'{"text":"Available","color":"gold","bold":true,"clickEvent":{"action":"run_command","value":"/function bunker:cannon_button"}}'} replace
playsound minecraft:block.note_block.bell master @s -40 67 87 1 1.5