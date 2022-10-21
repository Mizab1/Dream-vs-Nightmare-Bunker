#built using mc-build (https://github.com/mc-build/mc-build)

execute as @a at @s run playsound minecraft:block.basalt.break master @s ~ ~ ~ 1 1
title @a title {"text": "The Wave Has Begun","color": "green"}
execute as @a unless entity @s[nbt={Inventory:[{id:"minecraft:wooden_sword"}]}] run function store:weapon/wooden
scoreboard players add Wave: stats 1
scoreboard players add mobs mobs 3
scoreboard players operation mobsLeft mobs = mobs mobs
function spawn_mobs:spawn
scoreboard players set start private 1
effect give @a night_vision 999999 1 true
spawnpoint @a -40 67 88 0
summon villager -40 67 143 {Silent:1b,Team:"villager",PersistenceRequired:1b,NoAI:1b,CanPickUpLoot:0b,Health:40f,Tags:["mobs_ai"],Attributes:[{Name:generic.max_health,Base:40}],VillagerData:{profession:"minecraft:nitwit"}}
execute as @a at @s run playsound minecraft:custom.scary_music master @s ~ ~ ~ 0.3