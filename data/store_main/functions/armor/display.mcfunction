#built using mc-build (https://github.com/mc-build/mc-build)

execute positioned -37 68 89 run kill @e[type=item_frame,tag=armor_display,distance=..1.5]
execute if score armor_c private matches 1 run summon item_frame -37 68 89 {Facing:4b,Invisible:1b,Fixed:1b,Tags:["armor_display"],Item:{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{Name:'[{"text":"Armor level 1"},{"text":" 2 Points","color":"gold"}]'}}}}
execute if score armor_c private matches 2 run summon item_frame -37 68 89 {Facing:4b,Invisible:1b,Fixed:1b,Tags:["armor_display"],Item:{id:"minecraft:iron_chestplate",Count:1b,tag:{display:{Name:'[{"text":"Armor level 2"},{"text":" 6 Points","color":"gold"}]'}}}}
execute if score armor_c private matches 3 run summon item_frame -37 68 89 {Facing:4b,Invisible:1b,Fixed:1b,Tags:["armor_display"],Item:{id:"minecraft:diamond_chestplate",Count:1b,tag:{display:{Name:'[{"text":"Armor level 3"},{"text":" 15 Points","color":"gold"}]'}}}}
execute if score armor_c private matches 4 run summon item_frame -37 68 89 {Facing:4b,Invisible:1b,Fixed:1b,Tags:["armor_display"],Item:{id:"minecraft:netherite_chestplate",Count:1b,tag:{display:{Name:'[{"text":"Super Armor"},{"text":" 25 Points","color":"gold"}]'}}}}