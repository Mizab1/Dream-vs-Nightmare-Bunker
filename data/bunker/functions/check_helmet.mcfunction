#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players set #execute LANG_MC_INTERNAL 0
execute as @s[nbt={Inventory:[{id:"minecraft:leather_helmet",Slot:103b}]}] run function bunker:__generated__/conditional/11
execute if score #execute LANG_MC_INTERNAL matches 0 as @s[nbt={Inventory:[{id:"minecraft:iron_helmet",Slot:103b}]}] run function bunker:__generated__/conditional/12
execute if score #execute LANG_MC_INTERNAL matches 0 as @s[nbt={Inventory:[{id:"minecraft:diamond_helmet",Slot:103b}]}] run function bunker:__generated__/conditional/13
execute if score #execute LANG_MC_INTERNAL matches 0 as @s[nbt={Inventory:[{id:"minecraft:netherite_helmet",Slot:103b}]}] run function bunker:__generated__/conditional/14