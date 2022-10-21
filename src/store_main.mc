dir weapon{
    function next{
        execute(if score weapon_c private < weapon_max private){
            scoreboard players add weapon_c private 1
            playsound minecraft:block.dispenser.dispense master @a -42 67 89 1 1
            function store_main:weapon/display
        }
    }
    function previous{
        execute(if score weapon_c private > weapon_min private){
            scoreboard players remove weapon_c private 1
            playsound minecraft:block.dispenser.dispense master @a -42 67 89 1 1.2
            function store_main:weapon/display
        }
    }
    function display{
        execute positioned -43 68 89 run kill @e[type=item_frame,tag=weapon_display,distance=..1.5]
        <%%
            weapon = [
                
                `summon item_frame -43 68 89 {Facing:5b,Invisible:1b,Fixed:1b,Tags:["weapon_display"],Item:{id:"minecraft:iron_sword",Count:1b,tag:{display:{Name:'[{"text":"Iron Sword"},{"text":" 6 Points","color":"gold"}]'}}}}`,
                
                `summon item_frame -43 68 89 {Facing:5b,Invisible:1b,Fixed:1b,Tags:["weapon_display"],Item:{id:"minecraft:diamond_sword",Count:1b,tag:{display:{Name:'[{"text":"Diamond Sword"},{"text":" 15 Points","color":"gold"}]'}}}}`,
                
                `summon item_frame -43 68 89 {Facing:5b,Invisible:1b,Fixed:1b,Tags:["weapon_display"],Item:{id:"minecraft:netherite_sword",Count:1b,tag:{display:{Name:'[{"text":"Netherite Sword"},{"text":" 20 Points","color":"gold"}]'}}}}`,
                
                `summon item_frame -43 68 89 {Facing:5b,Invisible:1b,Fixed:1b,Tags:["weapon_display"],Item:{id:"minecraft:bow",Count:1b,tag:{display:{Name:'[{"text":"Bow"},{"text":" 6 Points","color":"gold"}]'}}}}`,
                
                `summon item_frame -43 68 89 {Facing:5b,Invisible:1b,Fixed:1b,Tags:["weapon_display"],Item:{id:"minecraft:arrow",Count:1b,tag:{display:{Name:'[{"text":"Arrow"},{"text":" 1 Points for 2","color":"gold"}]'}}}}`,
                
                `summon item_frame -43 68 89 {Facing:5b,Invisible:1b,Fixed:1b,Tags:["weapon_display"],Item:{id:"minecraft:crossbow",Count:1b,tag:{display:{Name:'[{"text":"Crossbow"},{"text":" 12 Points","color":"gold"}]'}}}}`,
                
                `summon item_frame -43 68 89 {Facing:5b,Invisible:1b,Fixed:1b,Tags:["weapon_display"],Item:{id:"minecraft:cooked_chicken",Count:1b,tag:{display:{Name:'[{"text":"Food"},{"text":" 1 Point for 2","color":"gold"}]'}}}}`,

                `summon item_frame -43 68 89 {Facing:5b,Invisible:1b,Fixed:1b,Tags:["weapon_display"],Item:{id:"minecraft:lapis_lazuli",Count:1b,tag:{display:{Name:'[{"text":"Enchanting Stone"},{"text":" 1 Point","color":"gold"}]'}}}}`,
                
                `summon item_frame -43 68 89 {Facing:5b,Invisible:1b,Fixed:1b,Tags:["weapon_display"],Item:{id:"minecraft:shield",Count:1b,tag:{display:{Name:'[{"text":"Shield"},{"text":" 4 Point","color":"gold"}]'}}}}`,
                
                `summon item_frame -43 68 89 {Facing:5b,Invisible:1b,Fixed:1b,Tags:["weapon_display"],Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{display:{Name:'[{"text":"Explosive Trap"},{"text":" 20 Points","color":"gold"}]'},CustomModelData:102004}}}`,

                `summon item_frame -43 68 89 {Facing:5b,Invisible:1b,Fixed:1b,Tags:["weapon_display"],Item:{id:"minecraft:golden_apple",Count:1b,tag:{display:{Name:'[{"text":"Golden Apple"},{"text":" 5 Points","color":"gold"}]'}}}}`,

                // `summon item_frame -43 68 89 {Facing:5b,Invisible:1b,Fixed:1b,Tags:["weapon_display"],Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{display:{Name:'[{"text":"Lead Gun"},{"text":" 25 Points","color":"gold"}]'},CustomModelData:102008}}}`,

                `summon item_frame -43 68 89 {Facing:5b,Invisible:1b,Fixed:1b,Tags:["weapon_display"],Item:{id:"minecraft:snowball",Count:1b,tag:{display:{Name:'[{"text":"Dream Bomb"},{"text":" 10 Points","color":"gold"}]'}}}}`,

                `summon item_frame -43 68 89 {Facing:5b,Invisible:1b,Fixed:1b,Tags:["weapon_display"],Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{display:{Name:'[{"text":"Heavenator"},{"text":" 30 Points","color":"gold"}]'},CustomModelData:110016}}}`,

                `summon item_frame -43 68 89 {Facing:5b,Invisible:1b,Fixed:1b,Tags:["weapon_display"],Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{display:{Name:'[{"text":"Soporific Laser"},{"text":" 35 Points","color":"gold"}]'},CustomModelData:110017}}}`,

                // `summon item_frame -43 68 89 {Facing:5b,Invisible:1b,Fixed:1b,Tags:["weapon_display"],Item:{id:"minecraft:chainmail_helmet",Count:1b,tag:{display:{Name:'[{"text":"Geiger Goggles"},{"text":" 40 Points","color":"gold"}]'}}}}`,

                `summon item_frame -43 68 89 {Facing:5b,Invisible:1b,Fixed:1b,Tags:["weapon_display"],Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{display:{Name:'[{"text":"Demons Capturing Device"},{"text":" 10 Points","color":"gold"}]'},CustomModelData:102012}}}`,

            ]
            weapon.forEach(function (value, i){
                emit(`execute if score weapon_c private matches ${i+1} run ${value}`);
            });
            config.weapon_count = weapon.length;
            
        %%>     
    }
    dir buy{
        function iron{
            execute(if score @s point matches 6..){
                function store:weapon/iron
                scoreboard players remove @s point 6
                playsound minecraft:entity.arrow.hit_player master @a -42 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 89 1 0.7
            }
        }
        function diamond{
            execute(if score @s point matches 15..){
                function store:weapon/diamond
                scoreboard players remove @s point 15
                playsound minecraft:entity.arrow.hit_player master @a -42 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 89 1 0.7
            }
        }
        function netherite{
            execute(if score @s point matches 20..){
                function store:weapon/netherite
                scoreboard players remove @s point 20
                playsound minecraft:entity.arrow.hit_player master @a -42 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 89 1 0.7
            }
        }
        function bow{
            execute(if score @s point matches 6..){
                function store:weapon/bow
                scoreboard players remove @s point 6
                playsound minecraft:entity.arrow.hit_player master @a -42 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 89 1 0.7
            }
        }
        function arrow{
            execute(if score @s point matches 1..){
                function store:weapon/arrow
                scoreboard players remove @s point 1
                playsound minecraft:entity.arrow.hit_player master @a -42 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 89 1 0.7
            }
        }
        function crossbow{
            execute(if score @s point matches 12..){
                function store:weapon/crossbow
                scoreboard players remove @s point 12
                playsound minecraft:entity.arrow.hit_player master @a -42 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 89 1 0.7
            }
        }
        function food{
            execute(if score @s point matches 1..){
                function store:weapon/food
                scoreboard players remove @s point 1
                playsound minecraft:entity.arrow.hit_player master @a -42 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 89 1 0.7
            }
        }
        function lapis{
            execute(if score @s point matches 1..){
                function store:weapon/lapis_lazuli
                scoreboard players remove @s point 1
                playsound minecraft:entity.arrow.hit_player master @a -42 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 89 1 0.7
            }
        }
        function shield{
            execute(if score @s point matches 4..){
                function store:weapon/shield
                scoreboard players remove @s point 4
                playsound minecraft:entity.arrow.hit_player master @a -42 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 89 1 0.7
            }
        }
        function airstrike{
            execute(if score @s point matches 20..){
                function store:weapon/airstrike
                scoreboard players remove @s point 20
                playsound minecraft:entity.arrow.hit_player master @a -42 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 89 1 0.7
            }
        }
        function golden_apple{
            execute(if score @s point matches 5..){
                function store:weapon/golden_apple
                scoreboard players remove @s point 5
                playsound minecraft:entity.arrow.hit_player master @a -42 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 89 1 0.7
            }
        }
        function lead_gun{
            execute(if score @s point matches 25..){
                function store:weapon/lead_gun
                scoreboard players remove @s point 25
                playsound minecraft:entity.arrow.hit_player master @a -42 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 89 1 0.7
            }
        }
        function ghost_bomb{
            execute(if score @s point matches 10..){
                function store:weapon/ghost_bomb
                scoreboard players remove @s point 10
                playsound minecraft:entity.arrow.hit_player master @a -42 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 89 1 0.7
            }
        }
        function conversion_gun{
            execute(if score @s point matches 30..){
                function store:weapon/conversion_gun
                scoreboard players remove @s point 30
                playsound minecraft:entity.arrow.hit_player master @a -42 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 89 1 0.7
            }
        }
        function radioactive_gun{
            execute(if score @s point matches 35..){
                function store:weapon/radioactive_gun
                scoreboard players remove @s point 35
                playsound minecraft:entity.arrow.hit_player master @a -42 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 89 1 0.7
            }
        }
        function ecto_goggles{
            execute(if score @s point matches 40..){
                function store:weapon/ecto_goggles
                scoreboard players remove @s point 40
                playsound minecraft:entity.arrow.hit_player master @a -42 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 89 1 0.7
            }
        }
        function ghost_trap{
            execute(if score @s point matches 10..){
                function store:weapon/ghost_trap
                scoreboard players remove @s point 10
                playsound minecraft:entity.arrow.hit_player master @a -42 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 89 1 0.7
            }
        }
    }
}
dir armor{
    function next{
        execute(if score armor_c private < armor_max private){
            scoreboard players add armor_c private 1
            playsound minecraft:block.dispenser.dispense master @a -38 67 89 1 1
            function store_main:armor/display
        }
    }
    function previous{
        execute(if score armor_c private > armor_min private){
            scoreboard players remove armor_c private 1
            playsound minecraft:block.dispenser.dispense master @a -38 67 89 1 1.2
            function store_main:armor/display
        }
    }
    function display{
        execute positioned -37 68 89 run kill @e[type=item_frame,tag=armor_display,distance=..1.5]
        <%%
            armor = [
                `summon item_frame -37 68 89 {Facing:4b,Invisible:1b,Fixed:1b,Tags:["armor_display"],Item:{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{Name:'[{"text":"Armor level 1"},{"text":" 2 Points","color":"gold"}]'}}}}`,
        
                `summon item_frame -37 68 89 {Facing:4b,Invisible:1b,Fixed:1b,Tags:["armor_display"],Item:{id:"minecraft:iron_chestplate",Count:1b,tag:{display:{Name:'[{"text":"Armor level 2"},{"text":" 6 Points","color":"gold"}]'}}}}`,
            
                `summon item_frame -37 68 89 {Facing:4b,Invisible:1b,Fixed:1b,Tags:["armor_display"],Item:{id:"minecraft:diamond_chestplate",Count:1b,tag:{display:{Name:'[{"text":"Armor level 3"},{"text":" 15 Points","color":"gold"}]'}}}}`,
            
                `summon item_frame -37 68 89 {Facing:4b,Invisible:1b,Fixed:1b,Tags:["armor_display"],Item:{id:"minecraft:netherite_chestplate",Count:1b,tag:{display:{Name:'[{"text":"Super Armor"},{"text":" 25 Points","color":"gold"}]'}}}}`
            ]
            armor.forEach(function (value, i){
                emit(`execute if score armor_c private matches ${i+1} run ${value}`)
            });
            total_armor = armor.length;
        %%>
    }
    
    dir buy{
        function leather{
            execute(if score @s point matches 2..){
                function store:armor/lether
                scoreboard players remove @s point 2
                playsound minecraft:entity.arrow.hit_player master @a -38 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 89 1 0.7
            }
        }
        function iron{
            execute(if score @s point matches 6..){
                function store:armor/iron
                scoreboard players remove @s point 6
                playsound minecraft:entity.arrow.hit_player master @a -38 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 89 1 0.7
            }
        }
        function diamond{
            execute(if score @s point matches 15..){
                function store:armor/diamond
                scoreboard players remove @s point 15
                playsound minecraft:entity.arrow.hit_player master @a -38 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 89 1 0.7
            }
        }
        function netherite{
            execute(if score @s point matches 25..){
                function store:armor/netherite
                scoreboard players remove @s point 25
                playsound minecraft:entity.arrow.hit_player master @a -38 67 89 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 89 1 0.7
            }
        }
    }
}
dir defence{
    function next{
        execute(if score defence_c private < defence_max private){
            scoreboard players add defence_c private 1
            playsound minecraft:block.dispenser.dispense master @a -38 67 87 1 1
            function store_main:defence/display
        }
    }
    function previous{
        execute(if score defence_c private > defence_min private){
            scoreboard players remove defence_c private 1
            playsound minecraft:block.dispenser.dispense master @a -38 67 87 1 1.2
            function store_main:defence/display
        }
    }
    function display{
        execute positioned -38 68 86 run kill @e[type=item_frame,tag=defence_display,distance=..1.5]
        <%%
            defence = [
                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:birch_fence",Count:1b,tag:{display:{Name:'[{"text":"Dream Fence"},{"text":" 10 Points","color":"gold"}]'}}}}`,

                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:polished_diorite",Count:1b,tag:{display:{Name:'[{"text":"Dream Wall"},{"text":" 35 Points","color":"gold"}]'}}}}`,
            
                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:magma_block",Count:1b,tag:{display:{Name:'[{"text":"Dream Pit"},{"text":" 30 Points","color":"gold"}]'}}}}`,
            
                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:flint_and_steel",Count:1b,tag:{display:{Name:'[{"text":"Dream Flame"},{"text":" 35 Points","color":"gold"}]'}}}}`,
            
                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:birch_button",Count:1b,tag:{display:{Name:'[{"text":"Automatic Turret"},{"text":" 45 Points","color":"gold"}]'},CustomModelData:10009}}}`,
            
                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:birch_button",Count:1b,tag:{display:{Name:'[{"text":"Dream Pixies"},{"text":" 50 Points","color":"gold"}]'},CustomModelData:10006}}}`,
            
                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:enchanting_table",Count:1b,tag:{display:{Name:'[{"text":"Enchantment Room"},{"text":" 30 Points","color":"gold"}]'}}}}`,
              
                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:guardian_spawn_egg",Count:1b,tag:{display:{Name:'[{"text":"Dream Guard"},{"text":" 35 Points","color":"gold"}]'}}}}`,
              
                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:wooden_hoe",Count:1b,tag:{display:{Name:'[{"text":"Upgraded Turret"},{"text":" 50 Points","color":"gold"}]'},CustomModelData:110004}}}`,
              
                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:firework_rocket",Count:1b,tag:{display:{Name:'[{"text":"Dream Fireworks"},{"text":" 30 Points","color":"gold"}]'}}}}`,
              
                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:cactus",Count:1b,tag:{display:{Name:'[{"text":"Dream Pillar"},{"text":" 15 Points","color":"gold"}]'}}}}`,
              
                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:crying_obsidian",Count:1b,tag:{display:{Name:'[{"text":"Dream Pillar"},{"text":" 20 Points","color":"gold"}]'}}}}`,
              
                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:light_blue_stained_glass_pane",Count:1b,tag:{display:{Name:'[{"text":"Dream Pane"},{"text":" 25 Points","color":"gold"}]'}}}}`,
              
                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:endermite_spawn_egg",Count:1b,tag:{display:{Name:'[{"text":"Dream Mine"},{"text":" 35 Points","color":"gold"}]'},CustomModelData:110001}}}`,
              
                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:cobweb",Count:1b,tag:{display:{Name:'[{"text":"Dream Web"},{"text":" 40 Points","color":"gold"}]'}}}}`,
              
                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:beacon",Count:1b,tag:{display:{Name:'[{"text":"Dream Beacon"},{"text":" 35 Points","color":"gold"}]'}}}}`,

                // `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:endermite_spawn_egg",Count:1b,tag:{display:{Name:'[{"text":"Chemical Stick"},{"text":" 40 Points","color":"gold"}]'},CustomModelData:110007}}}`,

                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:yellow_concrete_powder",Count:1b,tag:{display:{Name:'[{"text":"Magic Sand"},{"text":" 25 Points","color":"gold"}]'}}}}`,

                // `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:pointed_dripstone",Count:1b,tag:{display:{Name:'[{"text":"Spike Trap"},{"text":" 40 Points","color":"gold"}]'}}}}`,

                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:powder_snow_bucket",Count:1b,tag:{display:{Name:'[{"text":"Snow Wall"},{"text":" 20 Points","color":"gold"}]'}}}}`,

                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:blue_ice",Count:1b,tag:{display:{Name:'[{"text":"Slippery Path"},{"text":" 10 Points","color":"gold"}]'}}}}`,

                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:note_block",Count:1b,tag:{display:{Name:'[{"text":"Fan"},{"text":" 25 Points","color":"gold"}]'}}}}`,

                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:honey_block",Count:1b,tag:{display:{Name:'[{"text":"Honey Block"},{"text":" 15 Points","color":"gold"}]'}}}}`,

                `summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:slime_block",Count:1b,tag:{display:{Name:'[{"text":"Slime"},{"text":" 25 Points","color":"gold"}]'}}}}`
            ]
            defence.forEach(function (value, i) {
                emit(`execute if score defence_c private matches ${i+1} run ${value}`)     
            })
            config.defence_count = defence.length;
        
        %%>
    }
    function wall_upgrade{
        execute if score wall_upgrade private matches 0 run{
            block{
                name stone_wall
                summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:cobblestone",Count:1b,tag:{display:{Name:'[{"text":"Wall"},{"text":" 25 Points","color":"gold"}]'}}}}
            }
        }
        execute if score wall_upgrade private matches 1 run{
            block{
                name iron_wall
                summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:iron_block",Count:1b,tag:{display:{Name:'[{"text":"Wall"},{"text":" 25 Points","color":"gold"}]'}}}}
            }
        }
        execute if score wall_upgrade private matches 2 run{
            block{
                name diamond_wall
                summon item_frame -38 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["defence_display"],Item:{id:"minecraft:diamond_block",Count:1b,tag:{display:{Name:'[{"text":"Wall"},{"text":"25 Points","color":"gold"}]'}}}}
            }
        }
    }
    dir buy{
        function command_block{
            execute(if score @s point matches 40..){
                function store:defence/command_block
                scoreboard players remove @s point 40
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function acid{
            execute(if score @s point matches 20..){
                function store:defence/acid
                scoreboard players remove @s point 20
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function fence{
            execute(if score @s point matches 10..){
                function store:defence/fence
                scoreboard players remove @s point 10
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function wall{
            execute(if score @s point matches 25..){
                function store:defence/wall
                scoreboard players remove @s point 25
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function pit{
            execute(if score @s point matches 30..){
                function store:defence/pit
                scoreboard players remove @s point 30
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function fire{
            execute(if score @s point matches 35..){
                function store:defence/fire
                scoreboard players remove @s point 35
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function turret{
            execute(if score @s point matches 45..){
                function store:defence/turret
                scoreboard players remove @s point 45
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function drone{
            execute(if score @s point matches 50..){
                function store:defence/drone
                scoreboard players remove @s point 50
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function stonecutter{
            execute(if score @s point matches 35..){
                function store:defence/stonecutter
                scoreboard players remove @s point 35
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function ice{
            execute(if score @s point matches 10..){
                function store:defence/ice
                scoreboard players remove @s point 10
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function honey{
            execute(if score @s point matches 15..){
                function store:defence/honey
                scoreboard players remove @s point 15
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function enchant{
            execute(if score @s point matches 30..){
                function store:defence/enchant
                scoreboard players remove @s point 30
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function golem{
            execute(if score @s point matches 35..){
                function store:defence/golem
                scoreboard players remove @s point 35
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function cannon{
            execute(if score @s point matches 50..){
                function store:defence/cannon
                scoreboard players remove @s point 50
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function firework{
            execute(if score @s point matches 30..){
                function store:defence/firework
                scoreboard players remove @s point 30
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function dislike_plate{
            execute(if score @s point matches 35..){
                function store:defence/dislike_plate
                scoreboard players remove @s point 35
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function cactus{
            execute(if score @s point matches 15..){
                function store:defence/cactus
                scoreboard players remove @s point 15
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function obsidian{
            execute(if score @s point matches 20..){
                function store:defence/obsidian
                scoreboard players remove @s point 20
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function lightning{
            execute(if score @s point matches 25..){
                function store:defence/lightning
                scoreboard players remove @s point 25
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function landmine{
            execute(if score @s point matches 35..){
                function store:defence/landmine
                scoreboard players remove @s point 35
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function cobweb{
            execute(if score @s point matches 40..){
                function store:defence/cobweb
                scoreboard players remove @s point 40
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function laser{
            execute(if score @s point matches 35..){
                function store:defence/laser
                scoreboard players remove @s point 35
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function ghost_stripper{
            execute(if score @s point matches 40..){
                function store:defence/ghost_stripper
                scoreboard players remove @s point 40
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function slime{
            execute(if score @s point matches 25..){
                function store:defence/slime
                scoreboard players remove @s point 25
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function stalagmite{
            execute(if score @s point matches 40..){
                function store:defence/stalagmite
                scoreboard players remove @s point 40
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function powder_snow{
            execute(if score @s point matches 20..){
                function store:defence/powder_snow
                scoreboard players remove @s point 20
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function magic_sand{
            execute(if score @s point matches 25..){
                function store:defence/magic_sand
                scoreboard players remove @s point 25
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
        function fan{
            execute(if score @s point matches 25..){
                function store:defence/fan
                scoreboard players remove @s point 25
                playsound minecraft:entity.arrow.hit_player master @a -38 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -38 67 87 1 0.7
            }
        }
    }
}
dir potion{
    function next{
        execute(if score potion_c private < potion_max private){
            scoreboard players add potion_c private 1
            playsound minecraft:block.dispenser.dispense master @a -42 67 87 1 1
            function store_main:potion/display
        }
    }
    function previous{
        execute(if score potion_c private > potion_min private){
            scoreboard players remove potion_c private 1
            playsound minecraft:block.dispenser.dispense master @a -42 67 87 1 1.2
            function store_main:potion/display
        }
    }
    function display{
        execute positioned -42 68 86 run kill @e[type=item_frame,tag=potion_display,distance=..1.5]
        <%%
            potion = [
                `summon item_frame -42 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["potion_display"],Item:{id:"minecraft:potion",Count:1b,tag:{display:{Name:'[{"text":"Regneration"},{"text":" 25 Points","color":"gold"}]'}}}}`,
            
                `summon item_frame -42 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["potion_display"],Item:{id:"minecraft:potion",Count:1b,tag:{display:{Name:'[{"text":"Strength"},{"text":" 25 Points","color":"gold"}]'}}}}`,
            
                `summon item_frame -42 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["potion_display"],Item:{id:"minecraft:potion",Count:1b,tag:{display:{Name:'[{"text":"Saturation"},{"text":" 25 Points","color":"gold"}]'}}}}`,
            
                `summon item_frame -42 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["potion_display"],Item:{id:"minecraft:potion",Count:1b,tag:{display:{Name:'[{"text":"Speed"},{"text":" 25 Points","color":"gold"}]'}}}}`,
            
                `summon item_frame -42 68 86 {Facing:3b,Invisible:1b,Fixed:1b,Tags:["potion_display"],Item:{id:"minecraft:potion",Count:1b,tag:{display:{Name:'[{"text":"Jump Boost"},{"text":" 25 Points","color":"gold"}]'},CustomModelData:110001}}}`,
            ]
            potion.forEach(function (value, i) {
                emit(`execute if score potion_c private matches ${i+1} run ${value}`)
            });
            potion_count = potion.length;
        %%>
    }
    dir buy{
        function regen{
            execute(if score @s point matches 25..){
                function store:potion/regeneration
                scoreboard players remove @s point 25
                playsound minecraft:entity.arrow.hit_player master @a -42 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 87 1 0.7
            }
        }
        function strength{
            execute(if score @s point matches 25..){
                function store:potion/strength
                scoreboard players remove @s point 25
                playsound minecraft:entity.arrow.hit_player master @a -42 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 87 1 0.7
            }
        }
        function saturation{
            execute(if score @s point matches 25..){
                function store:potion/saturation
                scoreboard players remove @s point 25
                playsound minecraft:entity.arrow.hit_player master @a -42 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 87 1 0.7
            }
        }
        function speed{
            execute(if score @s point matches 25..){
                function store:potion/speed
                scoreboard players remove @s point 25
                playsound minecraft:entity.arrow.hit_player master @a -42 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 87 1 0.7
            }
        }
        function jump{
            execute(if score @s point matches 25..){
                function store:potion/jump_boost
                scoreboard players remove @s point 25
                playsound minecraft:entity.arrow.hit_player master @a -42 67 87 1 1.2
            }else{
                tellraw @s {"text": "You don't have enough money","color": "red"}
                playsound minecraft:block.note_block.didgeridoo master @a -42 67 87 1 0.7
            }
        }
    }
}

dir purchase{
    function weapon{
        <%%
            buy_weapon = [
                "iron",
                "diamond",
                "netherite",
                "bow",
                "arrow",
                "crossbow",
                "food",
                "lapis",
                "shield",
                "airstrike",
                "golden_apple",
                // "lead_gun",
                "ghost_bomb",
                "conversion_gun",
                "radioactive_gun",
                // "ecto_goggles",
                "ghost_trap"
            ]

            buy_weapon.forEach(function (value, i){
                emit(`execute if score weapon_c private matches ${i+1} run function store_main:weapon/buy/${value}`)
            });
            if(config.weapon_count != buy_weapon.length){
                console.log("\x1b[31m","[ err ] purchase weapon isn't equal to total weapon");
            }
        %%>
            
    }
    function armor{
        <%%
            buy_armor = [
                "leather",
                "iron",
                "diamond",
                "netherite"
            ]
            buy_armor.forEach(function (value, i){
                emit(`execute if score armor_c private matches ${i+1} run function store_main:armor/buy/${value}`)
            });

            if(total_armor != buy_armor.length){
                console.log("\x1b[31m","[ err ] purchase armor isn't equal to total rmor");
            }
        %%>
    }
    function defence{
        <%%
            defence_buy = [
                "fence",
                "wall",
                "pit",
                "fire",
                "turret",
                "drone",
                "enchant",
                "golem",
                "cannon",
                "firework",
                "cactus",
                "obsidian",
                "lightning",
                "landmine",
                "cobweb",
                "laser",
                // "ghost_stripper",
                "magic_sand",
                // "stalagmite",
                "powder_snow",
                "ice",
                "fan",
                "honey",
                "slime"
            ]
            defence_buy.forEach(function (value, i) {
                emit(`execute if score defence_c private matches ${i+1} run function store_main:defence/buy/${value}`)
                
            });
            if(config.defence_count != defence_buy.length){
                console.log("\x1b[31m","[ err ] purchase defence isn't equal to total defence");
            }
        %%>
    } 
    function potion{
        <%%
            potion_buy = [
                "regen",
                "strength",
                "saturation",
                "speed",
                "jump"
            ]
            potion_buy.forEach(function (value, i) {
                emit(`execute if score potion_c private matches ${i+1} run function store_main:potion/buy/${value}`)
            });
            if(potion_count != potion_buy.length){
                console.log("\x1b[31m","[ err ] purchase potion isn't equal to total potion");
            }
        %%>
    }
}