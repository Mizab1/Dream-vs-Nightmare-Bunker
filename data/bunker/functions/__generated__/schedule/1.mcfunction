#built using mc-build (https://github.com/mc-build/mc-build)

kill @e[type=item,nbt={Item:{id:"minecraft:iron_pickaxe"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:oak_planks"}}]
title @a times 10 20 10
effect give @a blindness 3 1 true
title @a title {"text": "You won!","color": "gold"}
stopsound @a
execute as @a at @s run playsound ui.toast.challenge_complete master @s ~ ~ ~ 1 1.5
schedule function bunker:__generated__/schedule/2 1s append