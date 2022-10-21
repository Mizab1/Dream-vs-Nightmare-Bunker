dir armor{
    function lether{
        give @s leather_chestplate{display:{Name:'{"text":"Armor level 1","italic":false}'}}
        give @s leather_helmet{display:{Name:'{"text":"Armor level 1","italic":false}'}}
        give @s leather_boots{display:{Name:'{"text":"Armor level 1","italic":false}'}}
        give @s leather_leggings{display:{Name:'{"text":"Armor level 1","italic":false}'}}
    }
    function iron{
        give @s iron_helmet{display:{Name:'{"text":"Armor level 2","italic":false}'}}
        give @s iron_chestplate{display:{Name:'{"text":"Armor level 2","italic":false}'}}
        give @s iron_leggings{display:{Name:'{"text":"Armor level 2","italic":false}'}}
        give @s iron_boots{display:{Name:'{"text":"Armor level 2","italic":false}'}}
    }
    function diamond{
        give @s diamond_helmet{display:{Name:'{"text":"Armor level 3","italic":false}'}}
        give @s diamond_chestplate{display:{Name:'{"text":"Armor level 3","italic":false}'}}
        give @s diamond_leggings{display:{Name:'{"text":"Armor level 3","italic":false}'}}
        give @s diamond_boots{display:{Name:'{"text":"Armor level 3","italic":false}'}}
    }
    function netherite{
        give @s netherite_helmet{display:{Name:'{"text":"Super Armor","italic":false}'}}
        give @s netherite_chestplate{display:{Name:'{"text":"Super Armor","italic":false}'}}
        give @s netherite_leggings{display:{Name:'{"text":"Super Armor","italic":false}'}}
        give @s netherite_boots{display:{Name:'{"text":"Super Armor","italic":false}'}}
    }
}

dir weapon{
    function hacker_weapon{
        give @s carrot_on_a_stick{display:{Name:'{"text":"Call Hacker","italic":false}'},CustomModelData:110015}
    }
    function wooden{
        give @s wooden_sword 1
    }
    function iron{
        give @s iron_sword 1
    }
    function diamond{
        give @s diamond_sword 1
    }
    function netherite{
        give @s netherite_sword 1
    }
    function bow{
        give @s bow
    }
    function arrow{
        give @s arrow 2
    }
    function crossbow{
        give @s crossbow{Enchantments:[{id:"minecraft:multishot",lvl:1s},{id:"minecraft:quick_charge",lvl:5s}]} 1
    }
    function food{
        give @s cooked_chicken{display:{Name:'{"text":"Food","italic":false}'}} 2
    }
    function golden_apple{
        give @s golden_apple{display:{Name:'{"text":"Golden Apple","italic":false}'}} 1
    }
    function lapis_lazuli{
        give @s lapis_lazuli{display:{Name:'{"text":"Enchanting Stone","italic":false}'}}
    }
    function shield{
        give @p minecraft:shield{display:{Name:'{"text":"Shield","italic":false}'}} 1
    }
    function ghost_bomb{
        give @s snowball{display:{Name:'{"text":"Lead Bomb","italic":false}'}} 1
    }
    function m4{
        give @s carrot_on_a_stick{display:{Name:'{"text":"M4A1","italic":false}'},CustomModelData:102001} 1
    }
    function glock{
        give @s carrot_on_a_stick{display:{Name:'{"text":"GLOCK","italic":false}'},CustomModelData:102002} 1
    }
    function airstrike{
        give @s carrot_on_a_stick{display:{Name:'{"text":"Explosive Trap","color":"#BFE8FF","italic":false}',Lore:['{"text":"Be careful, it can kill you","color":"red","italic":false}']},CustomModelData:102004} 1
    }
    function lightning_strike{
        give @s carrot_on_a_stick{display:{Name:'{"text":"Lightning Strike","italic":false}'},CustomModelData:102010} 1
    }
    function thunder{
        give @s carrot_on_a_stick{display:{Name:'{"text":"Thunder","italic":false}'},CustomModelData:102009} 1
    }
    function lead_gun{
        give @s carrot_on_a_stick{display:{Name:'{"text":"Lead Gun","color":"#70E7FF","italic":false}'},CustomModelData:102008} 1
    }
    function conversion_gun{
        give @s carrot_on_a_stick{display:{Name:'{"text":"Conversion Gun","color":"#70E7FF","italic":false}'},CustomModelData:110016} 1
    }
    function radioactive_gun{
        give @s carrot_on_a_stick{display:{Name:'{"text":"Radioactive Gun","color":"#70E7FF","italic":false}'},CustomModelData:110017} 1
    }
    function launchpad{
        give @s endermite_spawn_egg{display:{Name:'{"text":"Launchpad","italic":false}'},EntityTag:{Tags:["launchpad_en"]},CustomModelData:110006} 1
    }
    function flame_thrower{
        give @s carrot_on_a_stick{display:{Name:'{"text":"Flame Thrower","italic":false}'},CustomModelData:102016} 1
    }
    function fire_extinguisher{
        give @s carrot_on_a_stick{display:{Name:'{"text":"Fire Extinguisher","italic":false}'},CustomModelData:102017} 1
    }
    function levi_boot{
        give @s iron_boots{display:{Name:'{"text":"Levitation Boots","italic":false}'},CustomModelData:100000} 1
    }
    function miniature_magnet{
        give @s carrot_on_a_stick{display:{Name:'{"text":"Steam","color":"#70E7FF","italic":false}'},CustomModelData:102012} 1
    }
    function gravity_gun{
        give @s carrot_on_a_stick{display:{Name:'{"text":"Entity GRAVITY GUN","italic":false}'},CustomModelData:2b} 1
    }
    function lightning_gun{
        give @s carrot_on_a_stick{display:{Name:'{"text":"Lightning Gun","italic":false}'},CustomModelData:110012} 1
    }
    function zombificator{
        give @s carrot_on_a_stick{display:{Name:'{"text":"Zombificator","italic":false}'},CustomModelData:110013} 1
    }
    function cage{
        give @s endermite_spawn_egg{CanPlaceOn:["minecraft:stone","minecraft:andesite","minecraft:polished_andesite","minecraft:grass_block"],display:{Name:'{"text":"Cage","italic":false}'},CustomModelData:110005,EntityTag:{Silent:1b,Tags:["cage_en"],ActiveEffects:[{Id:14b,Amplifier:1b,Duration:999999,ShowParticles:0b}]}} 1
    }
    function ravager{
        give @s ravager_spawn_egg{EntityTag:{DeathLootTable:"minecraft:bat"}} 1
    }
    function carrot{
        give @s carrot 3
    }
    function pig{
        give @s pig_spawn_egg{EntityTag:{DeathLootTable:"minecraft:bat"}} 1
    }
    function pig_launcher{
        function pig_launcher:give
    }
    function anonymous_ulti_weapon{
        give @s carrot_on_a_stick{display:{Name:'{"text":"Anonymous Ultimate Weapon","italic":false}'},CustomModelData:110014} 1
    }
    function ecto_goggles{
        give @s chainmail_helmet{display:{Name:'{"text":"Ecto Goggles","italic":false}'}} 1
    }
    function ghost_trap{
        give @s carrot_on_a_stick{display:{Name:'{"text":"Mutant Capturing Device","italic":false}'},CustomModelData:102012} 1
    }
}

dir defence{
    function command_block{
        fill -9 66 58 -9 66 120 minecraft:command_block
        fill -10 66 120 -71 66 120 minecraft:command_block
        fill -71 66 119 -71 66 58 minecraft:command_block
        fill -70 66 58 -10 66 58 minecraft:command_block
    }
    function acid{
        fill -12 66 61 -13 66 117 water
        fill -14 66 117 -68 66 116 water
        fill -68 66 115 -67 66 61 water
        fill -66 66 61 -14 66 62 water
    }
    function dog{
        give @s bone{display:{Name:'{"text":"Pendrive","italic":false}',Lore:['{"text":"Feed this to the dog to tame it","color":"dark_purple"}']}} 24
        give @s wolf_spawn_egg{EntityTag:{CustomName:'{"text":"Virus","italic":false}'}} 1
    }
    function fence{
        fill -54 67 103 -26 67 103 minecraft:birch_fence
        fill -54 67 103 -54 67 75 minecraft:birch_fence
        fill -54 67 75 -26 67 75 minecraft:birch_fence
        fill -26 67 103 -26 67 75 minecraft:birch_fence
        setblock -40 67 103 minecraft:birch_fence_gate

        fill -40 67 102 -40 67 102 minecraft:birch_pressure_plate
    }
    function wall{
        # execute(if score wall_upgrade private matches 0){
        #     clone -58 57 72 -59 59 107 -59 67 72
        #     clone -59 57 71 -21 59 70 -59 67 70
        #     clone -22 57 72 -21 59 106 -22 67 72
        #     clone -21 57 108 -59 59 107 -59 67 107
        #     scoreboard players add wall_upgrade private 1
        #     function store_main:defence/iron_wall
        # }else execute(if score wall_upgrade private matches 1){
        #     clone -58 53 72 -59 55 107 -59 67 72
        #     clone -59 53 71 -21 55 70 -59 67 70
        #     clone -22 53 72 -21 55 106 -22 67 72
        #     clone -21 53 108 -59 55 107 -59 67 107
        #     function store_main:defence/diamond_wall
        #     scoreboard players add wall_upgrade private 1
        # }else execute(if score wall_upgrade private matches 2){
        #     clone -58 49 72 -59 51 107 -59 67 72
        #     clone -59 49 71 -21 51 70 -59 67 70
        #     clone -22 49 72 -21 51 106 -22 67 72
        #     clone -21 49 108 -59 51 107 -59 67 107
        # }

        clone -58 57 71 -22 63 107 -59 67 70 masked

        # fill -40 67 106 -41 67 106 minecraft:warped_pressure_plate
    }
    function pit{
        fill -63 63 66 -62 70 112 air
        fill -61 63 112 -17 70 111 air
        fill -18 63 110 -17 70 66 air
        fill -19 63 67 -61 70 66 air

        clone -16 56 113 -64 56 113 -64 66 113
        clone -64 56 112 -64 56 65 -64 66 65
        clone -63 56 65 -16 56 65 -63 66 65
        clone -16 56 66 -16 56 112 -16 66 66

        fill -16 66 65 -16 66 113 minecraft:white_concrete
        fill -17 66 113 -64 66 113 minecraft:white_concrete
        fill -64 66 112 -64 66 65 minecraft:white_concrete
        fill -63 66 65 -17 66 65 minecraft:white_concrete
    }
    function fire{
        fill -14 66 114 -66 66 115 minecraft:netherrack
        fill -65 66 113 -66 66 63 minecraft:netherrack
        fill -64 66 63 -14 66 64 minecraft:netherrack
        fill -15 66 65 -14 66 113 minecraft:netherrack

        fill -14 67 114 -66 67 115 minecraft:fire
        fill -65 67 113 -66 67 63 minecraft:fire
        fill -64 67 63 -14 67 64 minecraft:fire
        fill -15 67 65 -14 67 113 minecraft:fire
    }
    function landmine{
        # give @s endermite_spawn_egg{display:{Name:'{"text":"Anti-Ghost Trap","italic":false}',Lore:['{"text":"Place on grass Block"}']},EntityTag:{Tags:["lm_en"]},CustomModelData:110001} 1
        fill -82 66 131 2 66 129 minecraft:white_terracotta
        fill 2 66 128 0 66 47 minecraft:white_terracotta
        fill -1 66 47 -82 66 49 minecraft:white_terracotta
        fill -82 66 50 -80 66 128 minecraft:white_terracotta

        \# +z
        LOOP(82,i){
            summon endermite -82 67 <%47+i%> {Tags:["lm_en"]}
        }
        LOOP(82,i){
            summon endermite -81 67 <%47+i%> {Tags:["lm_en"]}
        }
        LOOP(82,i){
            summon endermite -80 67 <%47+i%> {Tags:["lm_en"]}
        }
        \# +X
        LOOP(82,i){
            summon endermite <%-82+i%> 67 131 {Tags:["lm_en"]}
        }
        LOOP(82,i){
            summon endermite <%-82+i%> 67 130 {Tags:["lm_en"]}
        }
        LOOP(82,i){
            summon endermite <%-82+i%> 67 129 {Tags:["lm_en"]}
        }
        \# -Z
        LOOP(82,i){
            summon endermite 2 67 <%50+i%> {Tags:["lm_en"]}
        }
        LOOP(82,i){
            summon endermite 1 67 <%50+i%> {Tags:["lm_en"]}
        }
        LOOP(82,i){
            summon endermite 0 67 <%50+i%> {Tags:["lm_en"]}
        }
        \# -X
        LOOP(82,i){
            summon endermite <%-79+i%> 67 47 {Tags:["lm_en"]}
        }
        LOOP(82,i){
            summon endermite <%-79+i%> 67 48 {Tags:["lm_en"]}
        }
        LOOP(82,i){
            summon endermite <%-79+i%> 67 49 {Tags:["lm_en"]}
        }
    }
    function forcefield{
        give @a carrot_on_a_stick{display:{Name:'{"text":"Forcefield Controller","italic": false}',Lore:['{"text":"Enforce the Force Field for 10 Seconds"}']},CustomModelData:110002,ff_rc:1b}
    }
    function turret{
        give @s minecraft:birch_button{LockdownItem:1b,LockdownData:{id:15,function_model:10009,block_model:10008,item_model:10009,block_id:1,item_id:1,channel:0},CustomModelData:10009,display:{Name:'{"text":"Laser Turret","italic":"false"}',Lore:['{"text":"No Code Assigned","color":"red"}','{"text":"Attacks Hostile Mobs","color":"green"}']}}
    }
    function drone{
        give @s minecraft:birch_button{LockdownItem:1b,LockdownData:{id:7,function_model:10007,block_model:10006,item_model:10006,block_id:1,item_id:1,channel:0},CustomModelData:10006,display:{Name:'{"text":"Defense Drone","italic":"false"}',Lore:['{"text":"No Code Assigned","color":"red"}','{"text":"Attacks Hostile Mobs","color":"green"}']}}
    }
    function laser{
        # execute as @e[type=armor_stand,tag=laser] at @s run{
        #     setblock ~ ~-1 ~ red_stained_glass
        #     setblock ~ ~-2 ~ beacon
        # }
        \# -Z
        LOOP(11,i){
            setblock -24 66 <%105 - (i * 3)%> white_stained_glass
            setblock -24 65 <%105 - (i * 3)%> beacon
        }
        \# -X
        LOOP(11,i){
            setblock <%-24 - (i * 3)%> 66 73 white_stained_glass
            setblock <%-24 - (i * 3)%> 65 73 beacon
        }
        \# +Z
        LOOP(11,i){
            setblock -56 66 <%73 + (i * 3)%> white_stained_glass
            setblock -56 65 <%73 + (i * 3)%> beacon
        }
        \# +X
        LOOP(11,i){
            setblock <%-56 + (i * 3)%> 66 105 white_stained_glass
            setblock <%-56 + (i * 3)%> 65 105 beacon
        }
    }
    function cobweb{
        fill -12 67 61 -13 67 117 minecraft:cobweb
        fill -14 67 117 -68 67 116 minecraft:cobweb
        fill -68 67 115 -67 67 61 minecraft:cobweb
        fill -66 67 61 -14 67 62 minecraft:cobweb
        # clone -12 57 117 -68 56 61 -68 66 61 filtered minecraft:emerald_block
    }
    function dislike_plate{
        fill -10 67 119 -70 67 118 minecraft:dark_oak_pressure_plate
        fill -70 67 117 -69 67 59 minecraft:dark_oak_pressure_plate
        fill -68 67 59 -10 67 60 minecraft:dark_oak_pressure_plate
        fill -10 67 61 -11 67 117 minecraft:dark_oak_pressure_plate
    }
    function ice{
        fill -7 66 56 -7 66 122 blue_ice
        fill -9 66 122 -73 66 122 blue_ice
        fill -73 66 121 -73 66 56 blue_ice
        fill -71 66 56 -8 66 56 blue_ice
    }
    function honey{
        fill -5 66 124 -74 66 124 minecraft:honey_block
        fill -75 66 124 -75 66 55 minecraft:honey_block
        fill -75 66 54 -6 66 54 minecraft:honey_block
        fill -5 66 54 -5 66 123 minecraft:honey_block
    }
    function stonecutter{
        fill -6 66 54 -5 66 124 minecraft:coal_block
        fill -7 66 124 -73 66 123 minecraft:coal_block
        fill -75 66 124 -74 66 56 minecraft:coal_block
        fill -75 66 54 -7 66 55 minecraft:coal_block
    }
    function enchant{
        setblock -36 66 92 minecraft:redstone_block
    }
    function golem{
        give @s guardian_spawn_egg{display:{Name:'{"text":"Golem Spawn Egg","italic":false}'},EntityTag:{id:"minecraft:iron_golem",DeathLootTable:"minecraft:bat",PlayerCreated:1b,CustomName:'{"text":"Guard"}'}} 1
    }
    function cannon{
        setblock -43 68 91 air
        setblock -43 68 91 warped_wall_sign[facing=east]{Text1:'[{"text":"[ ","color":"gray","bold":true},{"text":"Cannon","color":"blue"},{"text":" ]"}]',Text3:'{"text":"Available","color":"gold","bold":true,"clickEvent":{"action":"run_command","value":"/function bunker:cannon_button"}}'} replace
    }
    # function firework{
    #     fill -82 66 131 2 66 129 minecraft:dispenser[facing=up]
    #     fill 2 66 128 0 66 47 minecraft:dispenser[facing=up]
    #     fill -1 66 47 -82 66 49 minecraft:dispenser[facing=up]
    #     fill -82 66 50 -80 66 128 minecraft:dispenser[facing=up]
    # }
    function cactus{
        clone -76 56 125 -76 61 53 -76 66 53
        clone -76 61 53 -4 56 53 -76 66 53
        clone -4 61 53 -4 56 125 -4 66 53
        clone -4 61 125 -76 56 125 -76 66 125

        fill -77 66 52 -3 66 52 minecraft:white_wool
        fill -3 66 53 -3 66 126 minecraft:white_wool
        fill -4 66 126 -77 66 126 minecraft:white_wool
        fill -77 66 53 -77 66 125 minecraft:white_wool
    }
    function obsidian{
        clone -2 56 127 -78 60 127 -78 66 127
        clone -78 60 127 -78 56 51 -78 66 51
        clone -2 56 51 -78 60 51 -78 66 51
        clone -2 60 127 -2 56 51 -2 66 51

        fill -79 66 50 -1 66 50 minecraft:white_wool
        fill -1 66 51 -1 66 128 minecraft:white_wool
        fill -2 66 128 -79 66 128 minecraft:white_wool
        fill -79 66 127 -79 66 51 minecraft:white_wool
    }
    function lightning{
        clone 3 56 132 -83 63 132 -83 66 132
		clone -83 56 131 -83 63 46 -83 66 46
		clone 3 56 46 -82 63 46 -82 66 46
		clone 3 56 131 3 63 47 3 66 47
    }
    function water{
        fill -10 66 60 -70 66 59 tuff
        fill -70 66 61 -69 66 119 tuff
        fill -68 66 119 -10 66 118 tuff
        fill -10 66 117 -11 66 61 tuff
        LOOP(12,i){
            summon ravager <%-10 - (i*5)%> 67 119 {PersistenceRequired:1b,NoAI:1b,Health:1500f,Tags:["static_ravager"],Attributes:[{Name:generic.max_health,Base:1500}]}
            summon ravager <%-69 + (i*5)%> 67 59 {PersistenceRequired:1b,NoAI:1b,Health:1500f,Tags:["static_ravager"],Attributes:[{Name:generic.max_health,Base:1500}]}
            summon ravager -70 67 <%118 - (i*5)%> {PersistenceRequired:1b,NoAI:1b,Health:1500f,Tags:["static_ravager"],Attributes:[{Name:generic.max_health,Base:1500}]}
            summon ravager -10 67 <%60 + (i*5)%> {PersistenceRequired:1b,NoAI:1b,Health:1500f,Tags:["static_ravager"],Attributes:[{Name:generic.max_health,Base:1500}]}
        }

        fill -9 66 58 -71 66 58 minecraft:bedrock
        fill -71 66 59 -71 66 120 minecraft:bedrock
        fill -70 66 120 -9 66 120 minecraft:bedrock
        fill -9 66 119 -9 66 59 minecraft:bedrock
    }
    function spike{
        kill @e[tag=spike]
        LOOP(89, i){
            summon armor_stand <%-84+i%> 67 133 {NoGravity:1b,Marker:1b,Invisible:1b,Tags:["spike"],ArmorItems:[{},{},{},{id:"minecraft:endermite_spawn_egg",Count:1b,tag:{CustomModelData:110003}}]}
        }

        LOOP(88, i){
            summon armor_stand 4 67 <%132-i%> {NoGravity:1b,Marker:1b,Invisible:1b,Tags:["spike"],ArmorItems:[{},{},{},{id:"minecraft:endermite_spawn_egg",Count:1b,tag:{CustomModelData:110003}}]}
        }

        LOOP(88, i){
            summon armor_stand <%3-i%> 67 45 {NoGravity:1b,Marker:1b,Invisible:1b,Tags:["spike"],ArmorItems:[{},{},{},{id:"minecraft:endermite_spawn_egg",Count:1b,tag:{CustomModelData:110003}}]}
        }

        LOOP(87, i){
            summon armor_stand -84 67 <%46+i%> {NoGravity:1b,Marker:1b,Invisible:1b,Tags:["spike"],ArmorItems:[{},{},{},{id:"minecraft:endermite_spawn_egg",Count:1b,tag:{CustomModelData:110003}}]}
        }
    }
    function note_block{
        clone 6 56 135 -86 56 134 -86 66 134
        clone 6 56 133 5 56 43 5 66 43
        clone 4 56 44 -86 56 43 -86 66 43
        clone -85 56 133 -86 56 45 -86 66 45
    }
    function iron_turret{
        kill @e[tag=iron_cannon]

        LOOP(26, i){
            execute positioned <%-79+(i*3)%> 67 128 run function lockdown:devices/turret/new_iron_cannon
        }
        LOOP(26, i){
            execute positioned -1 67 <%51+(i*3)%> run function lockdown:devices/turret/new_iron_cannon
        }
        LOOP(26, i){
            execute positioned <%-79+(i*3)%> 67 50 run function lockdown:devices/turret/new_iron_cannon
        }
        LOOP(26, i){
            execute positioned -79 67 <%51+(i*3)%> run function lockdown:devices/turret/new_iron_cannon
        }
    }

    function launchpad_defense{
        kill @e[tag=launchpad]
        # -61 67 110 -20 67 110
        LOOP(15, i){
            summon armor_stand <%-61+(i*3)%> 67 110 {NoGravity:1b,Marker:1b,Invisible:1b,Tags:["launchpad"],ArmorItems:[{},{},{},{id:"minecraft:endermite_spawn_egg",Count:1b,tag:{CustomModelData:110006}}]}
        }

        # -19 67 110 -19 67 68
        LOOP(14, i){
            summon armor_stand -19 67 <%68+(i*3)%> {NoGravity:1b,Marker:1b,Invisible:1b,Tags:["launchpad"],ArmorItems:[{},{},{},{id:"minecraft:endermite_spawn_egg",Count:1b,tag:{CustomModelData:110006}}]}
        }

        # -20 67 68 -61 67 68
        LOOP(14, i){
            summon armor_stand <%-61+(i*3)%> 67 68 {NoGravity:1b,Marker:1b,Invisible:1b,Tags:["launchpad"],ArmorItems:[{},{},{},{id:"minecraft:endermite_spawn_egg",Count:1b,tag:{CustomModelData:110006}}]}
        }

        # -20 67 68 -61 67 109 
        LOOP(14, i){
            summon armor_stand -61 67 <%68+(i*3)%> {NoGravity:1b,Marker:1b,Invisible:1b,Tags:["launchpad"],ArmorItems:[{},{},{},{id:"minecraft:endermite_spawn_egg",Count:1b,tag:{CustomModelData:110006}}]}
        }
    }

    function ghost_stripper{
        # give @a endermite_spawn_egg{display:{Name:'{"text":"Ghost Stripper","italic":false}'},EntityTag:{Tags:["gs_en"]},CustomModelData:110007} 1
        \# +z
        LOOP(60,i){
            summon endermite -70 67 <%59+i%> {Tags:["gs_en"]}
        }
        \# +X
        LOOP(60,i){
            summon endermite <%-70+i%> 67 119 {Tags:["gs_en"]}
        }
        \# -Z
        LOOP(60,i){
            summon endermite -10 67 <%60+i%> {Tags:["gs_en"]}
        }
        \# -X
        LOOP(60,i){
            summon endermite <%-69+i%> 67 59 {Tags:["gs_en"]}
        }
    }
    function slime{
        fill -10 66 119 -68 66 118 minecraft:slime_block
        fill -69 66 119 -70 66 59 minecraft:slime_block
        fill -68 66 59 -12 66 60 minecraft:slime_block
        fill -11 66 59 -10 66 117 minecraft:slime_block  
    }
    function magic_sand{
        fill -72 66 57 -72 66 120 minecraft:yellow_concrete_powder
        fill -8 66 121 -8 66 58 minecraft:yellow_concrete_powder
        fill -72 66 121 -9 66 121 minecraft:yellow_concrete_powder
        fill -8 66 57 -71 66 57 minecraft:yellow_concrete_powder  
    }
    function firework{
        fill -74 66 123 -7 66 123 minecraft:dispenser[facing=up]
        fill -6 66 123 -6 66 56 minecraft:dispenser[facing=up]
        fill -6 66 55 -73 66 55 minecraft:dispenser[facing=up]
        fill -74 66 55 -74 66 122 minecraft:dispenser[facing=up]

        # fill -74 67 123 -7 67 123 minecraft:pointed_dripstone
        # fill -6 67 123 -6 67 56 minecraft:pointed_dripstone
        # fill -6 67 55 -73 67 55 minecraft:pointed_dripstone
        # fill -74 67 55 -74 67 122 minecraft:pointed_dripstone
    }

    function powder_snow{
        fill -9 67 120 -70 69 120 minecraft:powder_snow
        fill -71 67 120 -71 69 59 minecraft:powder_snow
        fill -71 67 58 -9 69 58 minecraft:powder_snow
        fill -9 67 59 -9 69 119 minecraft:powder_snow

        fill -9 66 120 -70 66 120 minecraft:white_wool
        fill -71 66 120 -71 66 59 minecraft:white_wool
        fill -71 66 58 -9 66 58 minecraft:white_wool
        fill -9 66 59 -9 66 119 minecraft:white_wool
    }
    function fan{
        clone 6 56 44 -84 56 43 -84 66 43
        clone -85 56 133 -86 56 43 -86 66 43
        clone -84 56 135 6 56 134 -84 66 134
        clone 6 56 133 5 56 43 5 66 43
    }
    
}

dir potion{
    function regeneration{
        effect give @a regeneration 300 1 true
    }
    function strength{
        effect give @a strength 300 1 true
    }
    function saturation{
        effect give @a saturation 300 1 true
    }
    function speed{
        effect give @a speed 300 1 true
    }
    function jump_boost{
        effect give @a jump_boost 300 1 true
    }
}