#built using mc-build (https://github.com/mc-build/mc-build)

execute as @e[type=villager,tag=hostage] at @s if entity @e[tag=enemy,distance=..3] run function bunker:__generated__/execute/10
execute as @e[type=villager,tag=hostage] at @s if score start private matches 1 unless entity @e[tag=enemy,distance=..120] run function bunker:__generated__/execute/13
execute as @e[type=villager, tag=mobs_ai] at @s run function bunker:__generated__/execute/16
execute as @e[type=area_effect_cloud,nbt={Effects:[{Id:15}]}] at @s run function bunker:__generated__/execute/21
execute as @a at @s if entity @e[type=area_effect_cloud, tag=radiation_poison, distance=..3] run effect give @s poison 3 0 true
execute as @e[type=phantom, tag=phantom] at @s run particle smoke ~ ~ ~ 0.1 0 0.1 0 10 normal
execute as @e[type=chicken, tag=chicken] at @s if entity @a[distance=..4] run function bunker:__generated__/execute/24
execute as @e[type=blaze, tag=blaze] at @s run function bunker:__generated__/execute/25
execute as @e[type=zombie_villager, tag=ghost] at @s run particle flame ~ ~1 ~ 0.1 0.1 0.1 0.1 2 normal
execute as @e[type=armor_stand,tag=laser] at @s if block ~ ~-1 ~ red_stained_glass if entity @e[tag=enemy,dy=0] run function bunker:__generated__/execute/27
execute as @e[tag=enemy] at @s if block ~ ~-0.35 ~ coal_block run execute rotated ~ 0 run tp @s ^ ^ ^-3
execute as @e[tag=enemy] at @s if block ~ ~-0.35 ~ coarse_dirt align xz unless entity @e[type=evoker_fangs,dy=0] run summon minecraft:evoker_fangs ~0.5 ~ ~0.5
execute as @e[tag=enemy,tag=!electric_pass,tag=!pass] at @s run function bunker:__generated__/execute/31
execute as @e[tag=enemy, tag=!firework_ytber] at @s if block ~ ~-0.35 ~ dispenser run function bunker:__generated__/execute/36
execute as @e[tag=enemy] at @s if block ~ ~-0.35 ~ yellow_stained_glass unless entity @e[type=armor_stand, tag=trap_cobweb_AS, distance=..1] run summon armor_stand ~ ~ ~ {Tags:["trap_cobweb_AS"], Invisible: 1b, Marker:1b}
execute as @e[type=armor_stand, tag=trap_cobweb_AS] at @s run function bunker:__generated__/execute/38
execute as @e[tag=enemy] at @s if block ~ ~-0.35 ~ ice run function bunker:__generated__/execute/39
execute as @e[type=endermite,tag=lm_en] at @s run function bunker:__generated__/execute/40
execute as @e[type=armor_stand,tag=lm] at @s if entity @e[tag=enemy,distance=..0.5] run function bunker:__generated__/execute/41
execute as @e[tag=enemy] at @s if block ~ ~-0.35 ~ dripstone_block run function bunker:__generated__/execute/42
execute as @a[scores={ff_rc=1..}, predicate=bunker:conversion_gun] at @s run function bunker:__generated__/execute/45
execute as @e[tag=enemy] at @s if score @s capture_time matches 20.. run function bunker:__generated__/execute/49
execute store result bossbar minecraft:converting value run scoreboard players get @e[tag=shot, limit=1] capture_time
execute as @a[scores={ff_rc=1..}, predicate=bunker:soporific_laser] at @s run function bunker:__generated__/execute/51
execute as @a[scores={ff_rc=1..}, predicate=bunker:lead_gun] at @s run function bunker:__generated__/execute/55
execute as @a[predicate=bunker:ecto_goggles] run effect give @e[tag=enemy] glowing 1 0 true
execute as @a[scores={ff_rc=1..}, predicate=bunker:ghost_trap] at @s run function bunker:__generated__/execute/60
execute if score triggered_magnetic_dev private matches 1.. as @e[type=item,nbt={Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{CustomModelData:102012}}}] at @s if entity @e[tag=enemy, distance=..1] run function bunker:__generated__/execute/61
execute if score triggered_magnetic_dev private matches 1.. as @e[tag=enemy] at @s facing entity @e[type=item,nbt={Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{CustomModelData:102012}}}, limit=1] eyes run tp @s ^ ^ ^0.1 ~ 0
execute as @e[type=armor_stand,tag=nuke] at @s unless block ~ ~-0.35 ~ air run function bunker:__generated__/execute/63
execute as @e[type=zombie,tag=pass] at @s unless block ~ ~-0.05 ~ air run kill @s
scoreboard players set Mobs: stats 0
execute as @e[tag=enemy] run scoreboard players add Mobs: stats 1
execute as @a[team=!main] run team join main @s
execute as @e[tag=enemy, team=!enemy] run team join enemy @s
effect give @a night_vision 999999 1 true
execute as @a[x=-40, y=81, z=94, dy=6, predicate=bunker:sneak] at @s run function bunker:cannon_exit