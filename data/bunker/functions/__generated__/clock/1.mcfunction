#built using mc-build (https://github.com/mc-build/mc-build)

schedule function bunker:__generated__/clock/1 1s
tag @e[tag=enemy, tag=firework_ytber] remove firework_ytber
execute if block -8 66 57 minecraft:yellow_concrete_powder run function bunker:__generated__/execute/1
execute as @a at @s if entity @e[type=slime, distance=..3] run effect give @s poison 6 0 true
execute as @a at @s if entity @e[tag=can_poison, distance=..2] run effect give @s poison 6 0 true
execute as @e[type=item,nbt={Item:{id:"minecraft:wooden_hoe",Count:1b,tag:{CustomModelData:100005}}}] at @s unless block ~ ~-0.35 ~ air run function bunker:__generated__/execute/4
execute as @e[tag=enemy] at @s if block ~ ~-0.35 ~ note_block run effect give @s levitation 2 1 true