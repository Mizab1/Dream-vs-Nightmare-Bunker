#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players set cannon_av private 0
function bunker:check_helmet
tp @s -52 77 94 0 0
effect give @s minecraft:slowness 999999 225 true
effect give @s minecraft:invisibility 999999 225 true
effect give @s minecraft:resistance 999999 225 true
playsound minecraft:block.note_block.bell master @s -40 86 99 1 0.9
give @s carrot_on_a_stick{display:{Name:'{"text":"Fire the Cannon","color":"#D4FFDF","italic":false}',Lore:['{"text":"Right Click to fire the Cannon","color":"#80A2FF","italic":false}']},CustomModelData:110011} 1
item replace entity @s armor.head with minecraft:wooden_hoe{CustomModelData:110002}
setblock -43 68 91 air
setblock -43 68 91 warped_wall_sign[facing=east]{Text1:'[{"text":"[ ","color":"gray","bold":true},{"text":"Cannon","color":"blue"},{"text":" ]"}]',Text3:'{"text":"Occupied","color":"dark_red","bold":true}'} replace
tellraw @s {"text":"Sneak to exit","color":"gold"}
scoreboard players set #execute LANG_MC_INTERNAL 1