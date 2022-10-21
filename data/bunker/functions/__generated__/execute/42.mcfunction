#built using mc-build (https://github.com/mc-build/mc-build)

execute align xz unless entity @e[type=armor_stand, tag=stalagmite_as] run summon armor_stand ~0.5 ~ ~0.5 {Invisible:1b, NoGravity:1b, Tags:["stalagmite_as"]}
effect give @s slowness 1 50 true
effect give @s levitation 1 10 true
execute at @e[type=armor_stand, tag=stalagmite_as] run setblock ~ ~ ~ pointed_dripstone
tag @e[type=armor_stand,tag=stalagmite_as] add stalagmite_wait
schedule function bunker:__generated__/schedule/3 3s append