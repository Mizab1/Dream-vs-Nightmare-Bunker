#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add cw_mobs mobs 100
scoreboard players add cw_mobs_pro mobs 100
setblock -32 59 92 air
setblock -32 59 92 minecraft:warped_wall_sign[facing=west]{Text2:'[{"text":"[ ","color":"gray","bold":true},{"text":"Counter","color":"green"},{"text":" ]"}]',Text4:'{"score":{"name":"cw_mobs_pro","objective":"mobs"},"color":"dark_green","bold":true}'} replace
playsound minecraft:block.dispenser.dispense master @a -32 59 92 4 1.2