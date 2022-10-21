import ./macros/rngV2.mcm
import ./macros/wait_as.mcm
import ./macros/raycast.mcm

function load{
    time set midnight
    gamerule mobGriefing false
    gamerule sendCommandFeedback false
    gamerule keepInventory true
    gamerule doFireTick false
    gamerule fireDamage false
    gamerule universalAnger true
    gamerule forgiveDeadPlayers false
    gamerule doMobLoot false

	#> Default (Declare)
    # Internal MCB scoreboard (Don't touch)
    scoreboard objectives add LANG_MC_INTERNAL dummy
    # Clicked COAS
    scoreboard objectives add ff_rc used:carrot_on_a_stick
    # How many times the player has dies
    scoreboard objectives add death deathCount
    # its a scoreboard that handles all the backend stuff, edit with caution
    scoreboard objectives add private dummy
	# handles the number of current mobs in the arena (only if the start variable is high)
    scoreboard objectives add mobs dummy
    # RNG variable (it is recommanded not to poke around with it)
    scoreboard objectives add rng_score dummy
	# Handles the points of the player (with points you can buy many defences)
    scoreboard objectives add point dummy {"text": "Points","color": "gold"}
    scoreboard objectives setdisplay list point
	# handles all the stats you can see on the side while playing the map (yes those color ones)
    scoreboard objectives add stats dummy {"text": "STATS","color": "green"}
    scoreboard objectives setdisplay sidebar stats
	# Custom wave declare
	scoreboard objectives add custom_wave dummy
	# ghost gun
    scoreboard objectives add capture_time dummy
    # ghost stripper
    scoreboard objectives add stripper_charge dummy

	#> Default (Define)
    # Current arsenal selected when you reload (c stand for current)
    scoreboard players set weapon_c private 1
    scoreboard players set armor_c private 1
    scoreboard players set defence_c private 1
    scoreboard players set potion_c private 1
    # Min number of arsenal (ofc it will be 1, ik its not 0, but deal with it :p) (Don't change it)
    scoreboard players set weapon_min private 1
    scoreboard players set armor_min private 1
    scoreboard players set defence_min private 1
    scoreboard players set potion_min private 1
    # This scoreboard handles the wave and start of the battle
    scoreboard players set start private 0
    scoreboard players set wave private 0
    scoreboard players set wave_type private 0
    scoreboard players set wave_mod private 5
    # it handles the cannon, like if the player is already using the cannon then don't let other players use it
    scoreboard players set cannon_av private 1
    scoreboard players set @a point 20
	# Custom wave
    # scoreboard players set $switch custom_wave 0
    scoreboard players set cw_mobs_min mobs 0
    scoreboard players set cw_mobs_main mobs 0
    scoreboard players set cw_mobs mobs 0
    scoreboard players set cw_mobs_pro mobs 0
    # Wall upgrade
    scoreboard players set wall_upgrade private 0
    setblock -32 59 92 air
    setblock -32 59 92 minecraft:warped_wall_sign[facing=west]{Text2:'[{"text":"[ ","color":"gray","bold":true},{"text":"Counter","color":"green"},{"text":" ]"}]',Text4:'{"score":{"name":"cw_mobs_pro","objective":"mobs"},"color":"dark_green","bold":true}'} replace
	# Gives color to laster stats
    team add red
    team modify red color red
    team join red Mobs:
    # Make two teams of enemy (zombies or any enemy) and players
    team add main
    team add enemy
    team modify main collisionRule never
    team modify main friendlyFire false




	#> Variables (Can be changed according to need)
    # Max number of arsenal (increase it as you add more weapon, armor, etc)
    scoreboard players set weapon_max private <%config.weapon_count%>
    scoreboard players set armor_max private 4
    scoreboard players set defence_max private <%config.defence_count%>
    scoreboard players set potion_max private 5

    # Items related
	scoreboard players set triggered_magnetic_dev private 0
    scoreboard objectives add spike_used dummy

    # defences
	scoreboard objectives add ufo_abduction dummy

    # ectoplasm
    # scoreboard players set ecto_storage_c private 0
    scoreboard objectives add value dummy
    # tag @a remove gun_granted

    
}

#> ---------------------------------------------- Clocks ----------------------------------------------
clock 10t{
    execute as @e[tag=sleeping] at @s run{
        particle minecraft:angry_villager ~ ~1.5 ~ 0 0 0 0 1 force
    }
}

clock 1s {
    tag @e[tag=enemy, tag=firework_ytber] remove firework_ytber
    #> Command block
    # execute as @e[tag=enemy] at @s if block ~ ~-0.35 ~ command_block run{
    #     effect give @s instant_health 1 1 true
    # }
    # #> Acid
    # execute as @e[tag=enemy] at @s if block ~ ~ ~ water run{
    #     summon evoker_fangs
    # }

    execute if block -8 66 57 minecraft:yellow_concrete_powder run{
        #left
        particle dust 1.000 0.973 0.212 1 -72 67 88.5 0.3 0 18 1 1000 force
        particle dust 0.839 1.000 0.388 1 -72 67 88.5 0.3 0 18 1 1000 force
        #right
        particle dust 1.000 0.973 0.212 1 -8 67 88.5 0.3 0 18 1 1000 force
        particle dust 0.839 1.000 0.388 1 -8 67 88.5 0.3 0 18 1 1000 force
        #front
        particle dust 1.000 0.973 0.212 1 -40.5 67 121 18 0 0.3 1 1000 force
        particle dust 0.839 1.000 0.388 1 -40.5 67 121 18 0 0.3 1 1000 force
        #back
        particle dust 1.000 0.973 0.212 1 -40.5 67 57 18 0 0.3 1 1000 force
        particle dust 0.839 1.000 0.388 1 -40.5 67 57 18 0 0.3 1 1000 force
    }

    #> Ectoplasm
    # data modify storage temp Items set value []
    # data modify storage temp Items append from block -40 65 86 Items[{id:"minecraft:slime_ball"}].Count
    # execute store result score %length value run data get storage temp Items
    # scoreboard players set %total value 0
    # execute if score %length value matches 1.. run function bunker:count_recursive
    # setblock -40 68 86 air
    # setblock -40 68 86 warped_wall_sign[facing=south]{Color:"-1",Text1:'{"text":"Current","color":"gold"}',Text2:'{"text":"Nuclear","color":"gold"}',Text3:'{"text":"Waste","color":"gold"}',Text4:'{"score":{"name":"%total","objective":"value"},"color":"#FFFFFF"}'} replace

    # check
    # execute if score %total value matches 75.. if entity @a[tag=!gun_granted] run{
    #     execute as @a[tag=!gun_granted] run{
    #         give @s wooden_hoe{display:{Name:'{"text":"Nuke","color":"#70E7FF","italic":false}'},CustomModelData:100005} 10
    #         tellraw @s {"text":"You got a mysterious Nuke! Try it out", "color":"gold"}
    #         # tag @s add gun_granted
    #     }
    #     data merge block -40 65 86 {Items:[{id:"minecraft:air",Count:1b}]}
    # }

    # execute if score %total value matches 100.. run{
    #     give @a minecraft:birch_button{LockdownItem:1b,LockdownData:{id:15,function_model:10009,block_model:10008,item_model:10009,block_id:1,item_id:1,channel:0},CustomModelData:10009,display:{Name:'{"text":"Laser Turret","italic":"false"}',Lore:['{"text":"No Code Assigned","color":"red"}','{"text":"Attacks Hostile Mobs","color":"green"}']}}
    #     tellraw @a {"text":"You got a Automatic Turret! It captures ghost automatically, place it down and try", "color":"gold"}
    #     data merge block -40 65 86 {Items:[{id:"minecraft:air",Count:1b}]}
    # }

    #slime 
    execute as @a at @s if entity @e[type=slime, distance=..3] run{
        effect give @s poison 6 0 true
    }

    execute as @a at @s if entity @e[tag=can_poison, distance=..2] run{
        effect give @s poison 6 0 true
    }

    #nuke
    execute as @e[type=item,nbt={Item:{id:"minecraft:wooden_hoe",Count:1b,tag:{CustomModelData:100005}}}] at @s unless block ~ ~-0.35 ~ air run{
        data merge entity @s {PickupDelay:32767}
        summon armor_stand ~ ~10 ~ {Invisible:1b,Tags:["nuke"],ArmorItems:[{},{},{},{id:"minecraft:wooden_hoe",Count:1b,tag:{CustomModelData:100004}}]}
    }

    # fan
    execute as @e[tag=enemy] at @s if block ~ ~-0.35 ~ note_block run{
        effect give @s levitation 2 1 true
    }
}
clock 10s{
    tag @e[tag=enemy, tag=firework_ytber] remove firework_ytber
    tag @e[tag=enemy, tag=stripped] remove stripped
    tag @e[tag=enemy, tag=stepped_on_portal] remove stepped_on_portal
    effect give @e[type=zombie, tag=herobrine] levitation 3 2 true
    effect give @e[type=zombie, tag=herobrine] resistance 3 7 true

    # Blinding zombie effect
    execute as @e[type=zombie, tag=blinding_zombie] at @s run effect give @a[distance=..4] blindness 4 1 true

    # radition effect
    execute as @a at @s if entity @e[tag=can_radiate, distance=..4] run{
        effect give @s poison 10 0 true
        
    }
    execute at @e[tag=can_radiate] run{
        particle dust_color_transition 0.000 1.000 0.000 1 0.196 0.804 0.196 ~ ~ ~ 1 1 1 0 500 normal
        particle ambient_entity_effect ~ ~2 ~ 1 1 1 0 500 normal
    }
}
clock 15s{
    execute as @e[type=zombie,tag=entity_303] at @a[limit=1] rotated ~ 0 run{
        tp ^ ^ ^-3
    }
}

function withdraw_stalagmite{
    setblock ~ ~ ~ air
    kill @s
}

function tick{

    #> ---------------------------------------------- Control the starting of the waves and ending ----------------------------------------------
    # Hostage, check whether the zombie destroyed the bunker
    execute as @e[type=villager,tag=hostage] at @s if entity @e[tag=enemy,distance=..3] run{
        clone -56 106 222 -38 122 222 -49 79 157
        tp @e[tag=enemy] ~ ~-600 ~
        tp @e[tag=decoration_bat] ~ ~-600 ~
        scoreboard players set start private 0
        effect give @a blindness 3 1 true
        execute as @a at @s run playsound minecraft:entity.guardian.death master @s ~ ~ ~ 1 0.4
        title @a title {"text": "Game Over","color": "red"}
        title @a subtitle {"text": "The Hostage has been Killed","color": "green"}
        schedule 30t append{
            tp @a -40 67 88 0 0
            kill @e[type=vex]
            execute as @a at @s run{
              function bunker:cannon_exit
            } 
            stopsound @a
        }
    }
    # Zombie Detect (win the wave)
    execute as @e[type=villager,tag=hostage] at @s if score start private matches 1 unless entity @e[tag=enemy,distance=..120] run{
        scoreboard players set start private 0
        clone -56 106 231 -38 122 231 -49 79 157
        tp @e[type=bat, tag=decoration_bat] ~ ~-600 ~
        schedule 1s append{
            kill @e[type=item,nbt={Item:{id:"minecraft:iron_pickaxe"}}]
            kill @e[type=item,nbt={Item:{id:"minecraft:oak_planks"}}]
            title @a times 10 20 10
            effect give @a blindness 3 1 true
            title @a title {"text": "You won!","color": "gold"}
            stopsound @a
            execute as @a at @s run playsound ui.toast.challenge_complete master @s ~ ~ ~ 1 1.5
            schedule 1s append{
                tp @a -40 67 88 0 0
                kill @e[type=vex]
                execute as @a at @s run{
                  function bunker:cannon_exit
                } 
            }
        }
    }
    # Custom AI, villager that goes toward the bunker
    execute as @e[type=villager, tag=mobs_ai] at @s run{
        execute unless entity @e[type=villager,tag=hostage,distance=..15] run{
            execute rotated ~ 0 run tp @s ^ ^ ^0.15 facing entity @e[type=villager,tag=hostage,limit=1]
            execute if block ~ ~-0.05 ~ air run tp @s ~ ~-0.05 ~
        }
        execute if entity @e[type=villager,tag=hostage,distance=..15] run{
            tp @s ~ ~-600 ~
            kill @s
        } 
    }  

    #> ---------------------------------------------- Enemy Particles & Powers ---------------------------------------------------------------
    # Creeper
    execute as @e[type=area_effect_cloud,nbt={Effects:[{Id:15}]}] at @s run{
        summon creeper ~1 ~1 ~ 
        summon creeper ~ ~1 ~ 
        summon creeper ~-1 ~1 ~ 

        kill @s
    }

    # radiation_poison
    execute as @a at @s if entity @e[type=area_effect_cloud, tag=radiation_poison, distance=..3] run{
        effect give @s poison 3 0 true
    }

    # Phantom
    execute as @e[type=phantom, tag=phantom] at @s run{
        particle smoke ~ ~ ~ 0.1 0 0.1 0 10 normal
    }

    # Chicken
    execute as @e[type=chicken, tag=chicken] at @s if entity @a[distance=..4] run{
        summon creeper ~ ~ ~ {ignited:1b, Fuse:0}
        kill @s 
    } 

    #blaze
    execute as @e[type=blaze, tag=blaze] at @s run{
        particle smoke ~ ~ ~ 0.1 0 0.1 0 50 normal
        particle flame ~ ~ ~ 0.1 0 0.1 0.1 5 normal
    }

    # ghost / zombie villager
    execute as @e[type=zombie_villager, tag=ghost] at @s run{
        particle flame ~ ~1 ~ 0.1 0.1 0.1 0.1 2 normal
    }
    
    #> ---------------------------------------------- Defence Code ---------------------------------------------------------------

    #> Laser
    execute as @e[type=armor_stand,tag=laser] at @s if block ~ ~-1 ~ red_stained_glass if entity @e[tag=enemy,dy=0] run{
        effect give @e[type=#bunker:undead, tag=enemy,dy=0] instant_health 1 0 true
        effect give @e[type=!#bunker:undead, tag=enemy,dy=0] instant_health 1 0 true
    }

    #> ping
    execute as @e[tag=enemy] at @s if block ~ ~-0.35 ~ coal_block run{
        execute rotated ~ 0 run tp @s ^ ^ ^-3
    }

    #> Obsidian Defence
    execute as @e[tag=enemy] at @s if block ~ ~-0.35 ~ coarse_dirt align xz unless entity @e[type=evoker_fangs,dy=0] run{
        summon minecraft:evoker_fangs ~0.5 ~ ~0.5
    }

    #> Noteblock Defence
    # execute as @e[tag=enemy] at @s if block ~ ~-0.35 ~ note_block run{
    #     effect give @s slowness 2 2 true
    # }

    #> Electric Fence
    execute as @e[tag=enemy,tag=!electric_pass,tag=!pass] at @s run{
        execute if block ~1 ~ ~ light_blue_stained_glass_pane run{
            particle end_rod ~ ~1 ~ 0.5 0.5 0.5 0.1 10 normal
            execute(if entity @s[type=#bunker:undead]){
                effect give @s instant_health 1 0 true
            }else{
                effect give @s instant_damage 1 0 true
            }
        }
        execute if block ~-1 ~ ~ light_blue_stained_glass_pane run{
            particle end_rod ~ ~1 ~ 0.5 0.5 0.5 0.1 10 normal
            execute(if entity @s[type=#bunker:undead]){
                effect give @s instant_health 1 0 true
            }else{
                effect give @s instant_damage 1 0 true
            }
        }

        execute if block ~ ~ ~1 light_blue_stained_glass_pane run{
            particle end_rod ~ ~1 ~ 0.5 0.5 0.5 0.1 10 normal
            execute(if entity @s[type=#bunker:undead]){
                effect give @s instant_health 1 0 true
            }else{
                effect give @s instant_damage 1 0 true
            }
        }
        execute if block ~ ~ ~-1 light_blue_stained_glass_pane run{
            particle end_rod ~ ~1 ~ 0.5 0.5 0.5 0.1 10 normal
            execute(if entity @s[type=#bunker:undead]){
                effect give @s instant_health 1 0 true
            }else{
                effect give @s instant_damage 1 0 true
            }
        }
    }

    #> firework trap
    execute as @e[tag=enemy, tag=!firework_ytber] at @s if block ~ ~-0.35 ~ dispenser run{
        summon firework_rocket ~ ~ ~ {LifeTime:1,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Colors:[I;6549503,16777105]},{Type:0,Trail:1b,Colors:[I;16777215,15004371]}]}}}}
        tag @s add firework_ytber
    }

    #> Fire trap
    # execute as @e[tag=enemy] at @s if block ~ ~-0.35 ~ netherrack unless entity @e[type=armor_stand, tag=trap_fire_AS, distance=..1] run{
    #     summon armor_stand ~ ~ ~ {Tags:["trap_fire_AS"], Invisible: 1b, Marker:1b}
    # }
    # execute as @e[type=armor_stand, tag=trap_fire_AS] at @s run{
    #     execute(if entity @e[tag=enemy, distance=..1]){
    #         setblock ~ ~ ~ fire
    #     }else{
    #         setblock ~ ~ ~ air
    #         kill @s
    #     }
    # }

    #> Cobweb
    execute as @e[tag=enemy] at @s if block ~ ~-0.35 ~ yellow_stained_glass unless entity @e[type=armor_stand, tag=trap_cobweb_AS, distance=..1] run{
        summon armor_stand ~ ~ ~ {Tags:["trap_cobweb_AS"], Invisible: 1b, Marker:1b}
    }
    execute as @e[type=armor_stand, tag=trap_cobweb_AS] at @s run{
        execute(if entity @e[tag=enemy, distance=..1]){
            setblock ~ ~ ~ cobweb
        }else{
            setblock ~ ~ ~ air
            kill @s
        }
    }

	#> Ice
	execute as @e[tag=enemy] at @s if block ~ ~-0.35 ~ ice run{
        effect give @s slowness 1 2 true
		particle block snow_block ~ ~0.3 ~ 0.2 0.2 0.2 0 10
    }

    #> Ghost Stripper
    # as ghost stripper endermite to setup ghost stripper
    # execute as @e[type=endermite,tag=gs_en] at @s run{
    #     summon armor_stand ~ ~ ~ {NoGravity:1b,Marker:1b,Invisible:1b,Tags:["gs"],ArmorItems:[{},{},{},{id:"minecraft:endermite_spawn_egg",Count:1b,tag:{CustomModelData:110007}}]}
    #     tp @s ~ ~-600 ~
    # }
    # #> ghost stripper
    # execute as @e[type=armor_stand,tag=gs] at @s if entity @e[tag=enemy,tag=!stripped,distance=..1] run{
    #     execute as @e[tag=enemy, tag=!stripped, distance=..2] at @s run{
    #         execute as @e[type=#bunker:undead, tag=enemy, dx=0] at @s run{
    #             effect give @s instant_health 1 0
    #         }
    #         execute as @e[type=!#bunker:undead, tag=enemy, dx=0] at @s run{
    #             effect give @s instant_damage 1 0
    #         } 

    #         particle ambient_entity_effect ~ ~ ~ 1 1 1 0 200 normal
    #         particle ambient_entity_effect ~ ~ ~ 1.000 0.616 0.451 0 200 normal
    #         particle ambient_entity_effect ~ ~ ~ 0.718 1.000 0.290 0 200 normal
    #         particle ambient_entity_effect ~ ~ ~ 0.000 1.000 0.000 0 200 normal
            
    #         particle flash
    #         tag @s add stripped
    #     }
    #     # summon firework_rocket ~ ~ ~ {LifeTime:0,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:0,Trail:1b}]}}}}
    #     scoreboard players add @s stripper_charge 1
    #     execute if score @s stripper_charge matches 15.. run{
    #         kill @s
    #     }
    # }
    

    #> Landmines
    # as landmine endermite to setup landmine
    execute as @e[type=endermite,tag=lm_en] at @s run{
        summon armor_stand ~ ~ ~ {NoGravity:1b,Marker:1b,Invisible:1b,Tags:["lm"],ArmorItems:[{},{},{},{id:"minecraft:endermite_spawn_egg",Count:1b,tag:{CustomModelData:110001}}]}
        tp @s ~ ~-600 ~
    }
    # Landmine Functions
    execute as @e[type=armor_stand,tag=lm] at @s if entity @e[tag=enemy,distance=..0.5] run{
        summon creeper ~ ~ ~ {Fuse:0}
        kill @s
    }

    #> Stalagmite
    execute as @e[tag=enemy] at @s if block ~ ~-0.35 ~ dripstone_block run{
        execute align xz unless entity @e[type=armor_stand, tag=stalagmite_as] run summon armor_stand ~0.5 ~ ~0.5 {Invisible:1b, NoGravity:1b, Tags:["stalagmite_as"]}
        effect give @s slowness 1 50 true
        effect give @s levitation 1 10 true
        execute at @e[type=armor_stand, tag=stalagmite_as] run setblock ~ ~ ~ pointed_dripstone
        wait in stalagmite_wait as @e[type=armor_stand,tag=stalagmite_as] for 3s <function bunker:withdraw_stalagmite>
    }

    #> ---------------------------------------------- Items ---------------------------------------------------------------
    # radioactive gun
    # execute as @a[scores={ff_rc=1..}, predicate=bunker:anti_radiation_gun] at @s run{
    #     scoreboard players set @s ff_rc 0
    #     execute anchored eyes positioned ^ ^ ^1 if block ~ ~ ~ #bunker:bullet_passable run{
    #         particle dust 0.000 0.859 0.000 1 ~ ~ ~ 0 0 0 10 0 normal
    #         execute as @e[type=#bunker:undead, tag=enemy, dx=0] at @s run{
    #             effect give @s instant_health 1 0
    #             particle dust 0.000 0.859 0.000 1 ~ ~1 ~ 1 1 1 300 0 normal
    #         }
    #         execute as @e[type=!#bunker:undead, tag=enemy, dx=0] at @s run{
    #             effect give @s instant_damage 1 0
    #             particle dust 0.000 0.859 0.000 1 ~ ~1 ~ 1 1 1 300 0 normal
    #         }   
    #         execute if block ~ ~ ~ #bunker:bullet_passable unless entity @e[tag=enemy, dx=0] positioned ^ ^ ^1 run function $block
    #     }
    # }

    # conversion gun
    execute as @a[scores={ff_rc=1..}, predicate=bunker:conversion_gun] at @s run{
        scoreboard players set @s ff_rc 0
        # playsound minecraft:custom.vaccum.suck master @a ~ ~ ~ 1
        execute anchored eyes positioned ^ ^ ^1 if block ~ ~ ~ #bunker:bullet_passable run{
            particle dust_color_transition 1.000 0.996 0.929 1 1.000 1.000 0.039 ^-0.5 ^-0.1 ^0.2 0 0 0 0 1 normal
            execute as @e[tag=enemy, distance=..2] at @s run{
                bossbar add converting "Converting"
                bossbar set minecraft:converting max 20
                bossbar set minecraft:converting players @a
                particle falling_dust yellow_concrete ~ ~1 ~ .5 .5 .5 1 20 normal
                tag @s add shot
                schedule 10t replace{
                    tag @e[tag=shot] remove shot
                    bossbar remove minecraft:converting
                }
                # particle flash ~ ~1 ~ 0 0 0 0 1
                scoreboard players add @s capture_time 1

                schedule 1s replace{
                    scoreboard players set @e[tag=enemy] capture_time 0
                }
            }
            execute if block ~ ~ ~ #bunker:bullet_passable unless entity @e[tag=enemy, distance=..2] positioned ^ ^ ^1 run function $block
        }
    }
    execute as @e[tag=enemy] at @s if score @s capture_time matches 20.. run{
        particle dust 0.992 1.000 0.800 1 ~ ~ ~ 1 1 1 0 1000 normal
        summon slime ~ ~ ~ {Tags:["enemy"], Size:1}
        tp @s ~ ~-600 ~
        # summon item ~ ~ ~ {PickupDelay:20,Motion:[0.3,0.5,0.2],Item:{id:"minecraft:spider_eye",Count:1b,tag:{display:{Name:'{"text":"Ectoplasm","color":"gold","italic":false}'},CustomModelData:100000}}}
        # tp @e[tag=enemy, distance=..1] ~ ~-600 ~
        bossbar remove minecraft:converting
    }
    execute store result bossbar minecraft:converting value run scoreboard players get @e[tag=shot, limit=1] capture_time

    # execute as @a[scores={ff_rc=1..}, predicate=bunker:ghost_gun] at @s run{
    #     scoreboard players set @s ff_rc 0
    #     execute anchored eyes positioned ^ ^ ^1 if block ~ ~ ~ #bunker:bullet_passable run{
    #         particle crit
    #         execute as @e[type=#bunker:undead, tag=enemy, dx=0] at @s run{
    #             particle flash ~ ~1 ~ 0 0 0 0 1
    #             effect give @s instant_health 1 0
    #         }
    #         execute as @e[type=!#bunker:undead, tag=enemy, dx=0] at @s run{
    #             particle flash ~ ~1 ~ 0 0 0 0 1
    #             effect give @s instant_damage 1 0
    #         }   
    #         execute if block ~ ~ ~ #bunker:bullet_passable unless entity @e[tag=enemy, dx=0] positioned ^ ^ ^1 run function $block
    #     }
    # }

    # soporific laser (radioactive gun) (Laser gun)
    execute as @a[scores={ff_rc=1..}, predicate=bunker:soporific_laser] at @s run{
        scoreboard players set @s ff_rc 0
        playsound minecraft:item.trident.riptide_1 master @a ~ ~ ~ 1 2
        execute anchored eyes positioned ^ ^ ^1 if block ~ ~ ~ #bunker:bullet_passable run{
            particle dust 1 0 0.000 1 ^-0.3 ^-0.3 ^0.2 0 0 0 10 0 normal
            execute as @e[tag=enemy, dx=0] at @s run{
                effect give @s slowness 5 20 true
                tag @s add sleeping
                schedule 5s replace{
                    tag @e[tag=sleeping] remove sleeping
                }
            }
            # execute as @e[type=#bunker:undead, tag=enemy, dx=0] at @s run{
            #     particle flash ~ ~1 ~ 0 0 0 0 1
            #     effect give @s instant_health 1 0
            #     # summon item ~ ~ ~ {PickupDelay:20,Motion:[0.3,0.5,0.2],Item:{id:"minecraft:spider_eye",Count:1b,tag:{display:{Name:'{"text":"Ectoplasm","color":"gold","italic":false}'},CustomModelData:100000}}}
            # }
            # execute as @e[type=!#bunker:undead, tag=enemy, dx=0] at @s run{
            #     particle flash ~ ~1 ~ 0 0 0 0 1
            #     effect give @s instant_damage 1 0
            #     # summon item ~ ~ ~ {PickupDelay:20,Motion:[0.3,0.5,0.2],Item:{id:"minecraft:spider_eye",Count:1b,tag:{display:{Name:'{"text":"Ectoplasm","color":"gold","italic":false}'},CustomModelData:100000}}}
            # }   
            execute if block ~ ~ ~ #bunker:bullet_passable unless entity @e[tag=enemy, dx=0] positioned ^ ^ ^1 run function $block
        }
    }
    

    # lead gun
    execute as @a[scores={ff_rc=1..}, predicate=bunker:lead_gun] at @s run{
        
        scoreboard players set @s ff_rc 0
        execute anchored eyes positioned ^ ^ ^1 if block ~ ~ ~ #bunker:bullet_passable run{
            particle dust 0.400 0.478 0.447 1 ^-0.3 ^-0.3 ^0.2 0 0 0 1 1 normal
            execute as @e[tag=enemy, dx=0] at @s run{
                LOOP(60,i){
                    particle dust 0.361 0.620 0.584 1 ~<%Math.sin(i*0.2)%> ~<%i*0.06%> ~<%Math.cos(i*0.2)%> 0 0 0 1 1 normal
                }
                effect give @s slowness 6 10
            }  
            execute if block ~ ~ ~ #bunker:bullet_passable unless entity @e[tag=enemy, dx=0] positioned ^ ^ ^1 run function $block
        }
    }

    # Geiger googles
    execute as @a[predicate=bunker:ecto_goggles] run{
        effect give @e[tag=enemy] glowing 1 0 true
    }
    
    # Lead Trap
    execute as @a[scores={ff_rc=1..}, predicate=bunker:ghost_trap] at @s run{
        scoreboard players set @s ff_rc 0
        scoreboard players set triggered_magnetic_dev private 1
        tellraw @s {"text":"Throw this device on the ground now!", "color":"red"}
      
      schedule 10s append{
            scoreboard players set triggered_magnetic_dev private 0
            kill @e[type=item,nbt={Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{CustomModelData:102012}}}]
        }
    }
    execute if score triggered_magnetic_dev private matches 1.. as @e[type=item,nbt={Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{CustomModelData:102012}}}] at @s if entity @e[tag=enemy, distance=..1] run{
        data merge entity @s {PickupDelay:32767}
        tp @e[tag=enemy, distance=..1] ~ ~ ~
        particle dust_color_transition 1.000 0.996 0.929 1 1.000 1.000 0.039 ~ ~1 ~ 1 1 1 0 100 normal
        # particle dust_color_transition 0.000 1.000 0.000 1 0.196 0.804 0.196 ~ ~ ~ 1 1 1 0 1000 normal
        # particle soul ~ ~ ~ .5 .5 .5 .2 100 normal
        # summon item ~ ~ ~ {PickupDelay:20,Motion:[0.3,0.5,0.2],Item:{id:"minecraft:spider_eye",Count:1b,tag:{display:{Name:'{"text":"Ectoplasm","color":"gold","italic":false}'},CustomModelData:100000}}}
        tp @e[tag=enemy, distance=..1] ~ ~-600 ~
    } 
    execute if score triggered_magnetic_dev private matches 1.. as @e[tag=enemy] at @s facing entity @e[type=item,nbt={Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{CustomModelData:102012}}}, limit=1] eyes run{
        tp @s ^ ^ ^0.1 ~ 0
    }

    #> Nuke 
    execute as @e[type=armor_stand,tag=nuke] at @s unless block ~ ~-0.35 ~ air run{
        summon creeper ~ ~ ~ {ExplosionRadius:6b,Fuse:1,ignited:1b}
        particle campfire_signal_smoke ~ ~ ~ 1 1 1 1 300 normal
        particle dust 0.678 0.659 0.102 3 ~ ~ ~ 3 3 3 1 300 normal
        kill @e[tag=enemy, distance=..22]
        kill @s
    }

    #> ---------------------------------------------- Misc ---------------------------------------------------------------
    
    # Passenger Zombie, get killed when it senses the ground
    execute as @e[type=zombie,tag=pass] at @s unless block ~ ~-0.05 ~ air run kill @s

    # Enemy Counter (Stats)
    scoreboard players set Mobs: stats 0
    execute as @e[tag=enemy] run scoreboard players add Mobs: stats 1

    # player join the team
    execute as @a[team=!main] run team join main @s
    execute as @e[tag=enemy, team=!enemy] run team join enemy @s

    # Give night vision
    effect give @a night_vision 999999 1 true

    # exit the cannon when sneaked
    execute as @a[x=-40, y=81, z=94, dy=6, predicate=bunker:sneak] at @s run function bunker:cannon_exit
}
function count_recursive{
    execute store result score %count value run data get storage temp Items[-1]
    scoreboard players operation %total value += %count value
    scoreboard players remove %length value 1
    data remove storage temp Items[-1]
    execute if score %length value matches 1.. run function bunker:count_recursive
}

#> ---------------------------------------------- Cannon related functions ---------------------------------------------------------------
function cannon_button{
    execute(if score cannon_av private matches 1){
        scoreboard players set cannon_av private 0

		# Check the helmet
		block{
			name check_helmet
			execute(as @s[nbt={Inventory:[{id:"minecraft:leather_helmet",Slot:103b}]}]){
				tag @s add have_leather_helmet
			}else execute(as @s[nbt={Inventory:[{id:"minecraft:iron_helmet",Slot:103b}]}]){
				tag @s add have_iron_helmet
			}else execute(as @s[nbt={Inventory:[{id:"minecraft:diamond_helmet",Slot:103b}]}]){
				tag @s add have_diamond_helmet
			}else execute(as @s[nbt={Inventory:[{id:"minecraft:netherite_helmet",Slot:103b}]}]){
				tag @s add have_netherite_helmet
			}
		}

        tp @s -40 81 97 0 0
        effect give @s minecraft:slowness 999999 225 true
        effect give @s minecraft:invisibility 999999 225 true
        effect give @s minecraft:resistance 999999 225 true
        playsound minecraft:block.note_block.bell master @s -40 86 99 1 0.9

        give @s carrot_on_a_stick{display:{Name:'{"text":"Fire the Cannon","color":"#D4FFDF","italic":false}',Lore:['{"text":"Right Click to fire the Cannon","color":"#80A2FF","italic":false}']},CustomModelData:110011} 1

        item replace entity @s armor.head with minecraft:wooden_hoe{CustomModelData:110002}

        setblock -43 68 91 air
        setblock -43 68 91 warped_wall_sign[facing=east]{Text1:'[{"text":"[ ","color":"gray","bold":true},{"text":"Cannon","color":"blue"},{"text":" ]"}]',Text3:'{"text":"Occupied","color":"dark_red","bold":true}'} replace

        tellraw @s {"text":"Sneak to exit","color":"gold"}

        
    }
}
function cannon_exit{
    scoreboard players set cannon_av private 1
    tp @s -40 67 87 0 0

	block{
		name cannon_exit_no_tp

		effect clear @s slowness
		effect clear @s invisibility
		effect clear @s resistance
		clear @s carrot_on_a_stick{CustomModelData:110011}

		setblock -43 68 91 air
		setblock -43 68 91 warped_wall_sign[facing=east]{Text1:'[{"text":"[ ","color":"gray","bold":true},{"text":"Cannon","color":"blue"},{"text":" ]"}]',Text3:'{"text":"Available","color":"gold","bold":true,"clickEvent":{"action":"run_command","value":"/function bunker:cannon_button"}}'} replace

    	playsound minecraft:block.note_block.bell master @s -40 67 87 1 1.5
	}

	block{
		name give_helmet_if_applicable

		execute(as @s[tag=have_leather_helmet]){
			item replace entity @s armor.head with leather_helmet 1
			tag @s remove have_leather_helmet
		}else execute(as @s[tag=have_iron_helmet]){
			item replace entity @s armor.head with iron_helmet 1
			tag @s remove have_iron_helmet
		}else execute(as @s[tag=have_diamond_helmet]){
			item replace entity @s armor.head with diamond_helmet 1
			tag @s remove have_diamond_helmet
		}else execute(as @s[tag=have_netherite_helmet]){
			item replace entity @s armor.head with netherite_helmet 1
			tag @s remove have_netherite_helmet
		}else{
            item replace entity @s armor.head with air
        }
		
	}
}
function cannon_exit_wave{
    scoreboard players set cannon_av private 1
    tp @a -40 67 87 0 0

	function bunker:cannon_exit_no_tp
	function bunker:give_helmet_if_applicable

}


#> ---------------------------------------------- Spawn 2000+ zombies related functions ---------------------------------------------------------------
#> Warning: the difficulty of the game will gonna skyrocket with this function, this is zombie * 1000 function
# Second time ask if they re sure
function wave_200_ask{
    tellraw @s [{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n The map will become very difficult with this setting, You can revert it by using the reset button, Are you sure you want to do this?","color":"red"},{"text":"\n\n[Yes]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function bunker:wave_200"}},{"text":" [No]","color":"light_purple","clickEvent":{"action":"run_command","value":"/function bunker:wave_200_no"}}]
}
function wave_200{
    tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
    scoreboard players set Wave: stats 199
    scoreboard players set mobs mobs 1995
    tellraw @a {"text":"Zombie Count is set to 1000, click play to fight with them","color":"red"}
}
function wave_200_no{
    tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
    tellraw @a {"text":"Ok I won't change the difficulty","color":"green"}
}

#> ---------------------------------------------- Texture verifying functions (hat) ---------------------------------------------------------------
function reset_hat{
    summon item_frame -39 68 93 {Facing:4b,Invulnerable:1b,Invisible:1b,Tags:["hat_if"],Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{display:{Name:'{"text":"Click the button if you see the hat","color":"green"}'},CustomModelData:123321}}}
    setblock -39 67 93 polished_blackstone_button[facing=west]
}
function click_hat{
    kill @e[type=item_frame, tag=hat_if]
    setblock -39 67 93 air

    summon firework_rocket ~ ~1 ~-1 {LifeTime:20,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:2,Trail:1b,Colors:[I;3691519,16383810,16711680]},{Type:0,Colors:[I;382463,16723676]}]}}}}
    summon firework_rocket ~-1 ~1 ~ {LifeTime:20,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:2,Trail:1b,Colors:[I;3691519,16383810,16711680]},{Type:0,Colors:[I;382463,16723676]}]}}}}
}

#> ---------------------------------------------- Misc. functions ---------------------------------------------------------------
function add_point{
    scoreboard players add @s point 2
    advancement revoke @s only bunker:kill_the_mob
}

#> ---------------------------------------------- Predicates, blocks and such (json files) ---------------------------------------------------------------
#> Default Value (Do not change)
predicate ff_rc{
    "condition": "minecraft:entity_properties",
    "entity": "this",
    "predicate": {
        "equipment": {
            "mainhand": {
                "item": "minecraft:carrot_on_a_stick",
                "nbt": "{CustomModelData:110002}"
            }
        }
    }
}
predicate fire{
    "condition": "minecraft:entity_properties",
    "entity": "this",
    "predicate": {
        "equipment": {
            "mainhand": {
                "item": "minecraft:carrot_on_a_stick",
                "nbt": "{CustomModelData:110011}"
            }
        }
    }
}
predicate sneak{
    "condition": "minecraft:entity_properties",
    "entity": "this",
    "predicate": {
        "flags": {
            "is_sneaking": true
        }
    }
}
advancements kill_the_mob{
    "criteria": {
        "requirement": {
            "trigger": "minecraft:player_killed_entity",
            "conditions": {
                "player": [
                    {
                        "condition": "minecraft:entity_properties",
                        "entity": "this",
                        "predicate": {}
                    }
                ],
                "entity": []
            }
        }
    },
    "rewards": {
        "function": "bunker:add_point"
    }
}

#> Can be changed
predicate conversion_gun{
	"condition": "minecraft:entity_properties",
    "entity": "this",
    "predicate": {
        "equipment": {
            "mainhand": {
                "item": "minecraft:carrot_on_a_stick",
                "nbt": "{CustomModelData:110016}"
            }
        }
    }
}
predicate lead_gun{
	"condition": "minecraft:entity_properties",
    "entity": "this",
    "predicate": {
        "equipment": {
            "mainhand": {
                "item": "minecraft:carrot_on_a_stick",
                "nbt": "{CustomModelData:102008}"
            }
        }
    }
}

predicate soporific_laser{
    "condition": "minecraft:entity_properties",
    "entity": "this",
    "predicate": {
        "equipment": {
            "mainhand": {
                "item": "minecraft:carrot_on_a_stick",
                "nbt": "{CustomModelData:110017}"
            }
        }
    }
}

predicate ecto_goggles{
    "condition": "minecraft:entity_properties",
    "entity": "this",
    "predicate": {
            "equipment": {
            "head": {
                "items": [
                    "minecraft:chainmail_helmet"
                ]
            }
        }
    }
}

predicate ghost_trap{
	"condition": "minecraft:entity_properties",
    "entity": "this",
    "predicate": {
        "equipment": {
            "mainhand": {
                "item": "minecraft:carrot_on_a_stick",
                "nbt": "{CustomModelData:102012}"
            }
        }
    }
}

predicate anti_radiation_gun{
	"condition": "minecraft:entity_properties",
    "entity": "this",
    "predicate": {
        "equipment": {
            "mainhand": {
                "item": "minecraft:carrot_on_a_stick",
                "nbt": "{CustomModelData:110018}"
            }
        }
    }
}
# predicate iron_armor{
#   "condition": "minecraft:entity_properties",
#   "entity": "this",
#   "predicate": {
#     "equipment": {
#       "chest": {
#         "items": [
#           "minecraft:iron_chestplate"
#         ]
#       },
#       "legs": {
#         "items": [
#           "minecraft:iron_leggings"
#         ]
#       },
#       "feet": {
#         "items": [
#           "minecraft:iron_boots"
#         ]
#       }
#     }
#   }
# }

blocks bullet_passable{
    minecraft:fire
    minecraft:air
    minecraft:cave_air
    minecraft:fire
}

entities undead{
	zombie
	husk
	skeleton
    stray
    phantom
}