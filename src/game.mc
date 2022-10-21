function start{
    execute if score start private matches 0 run{
        gamemode survival @a
        schedule 1s append{
            execute as @a at @s run playsound minecraft:block.basalt.break master @s ~ ~ ~ 1 1
            title @a title {"text": "The Wave Has Begun","color": "green"}
            execute as @a unless entity @s[nbt={Inventory:[{id:"minecraft:wooden_sword"}]}] run function store:weapon/wooden
                #> Spawning
                scoreboard players add Wave: stats 1
                scoreboard players add mobs mobs 3
                scoreboard players operation mobsLeft mobs = mobs mobs
                function spawn_mobs:spawn
            # execute(if score $switch custom_wave matches 0){
            # }else execute(if score $switch custom_wave matches 1..){
            #     scoreboard players operation cw_mobs_main mobs = cw_mobs mobs
            #     scoreboard players add Wave: stats 1
            #     function spawn_mobs:spawn
            # }

            scoreboard players set start private 1
            effect give @a night_vision 999999 1 true

            spawnpoint @a -40 67 88 0

            # summon custom AI villager
            summon villager -40 67 143 {Silent:1b,Team:"villager",PersistenceRequired:1b,NoAI:1b,CanPickUpLoot:0b,Health:40f,Tags:["mobs_ai"],Attributes:[{Name:generic.max_health,Base:40}],VillagerData:{profession:"minecraft:nitwit"}}

            execute as @a at @s run playsound minecraft:custom.scary_music master @s ~ ~ ~ 0.3
        }
    }
}

#> -------------- Reset Waves
function reset_ask{
    tellraw @p {"text": "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
    tellraw @p [{"text":"Your points will also be reset! Are you sure You want to reset it","color":"red"},{"text":"\n\n[Yes]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function game:yes"}},{"text":" [No]","color":"light_purple","clickEvent":{"action":"run_command","value":"/function game:no"}}]
}
function yes{
    function game:reset
    tellraw @s {"text": "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nThe game has been reset!", "color": "red"}
}
function no{
    tellraw @s {"text": "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nOk sure! We will not reset you progress","color": "light_purple"}
}
function reset{
    scoreboard players set Wave: stats 0
    scoreboard players set mobs mobs 0
    scoreboard players set @a point 0
}

#> ---------------- Reset Arena
function reset_arena{
    kill @e[tag=iron_cannon]
    kill @e[tag=launchpad]
    fill -63 65 68 -62 63 112 air
    fill -19 63 66 -63 65 67 air
    fill -18 65 110 -17 63 66 air
    fill -63 63 112 -17 65 111 air
    LOOP(31, i){
        clone -94 <%16+i%> 38 11 <%16+i%> 138 -94 <%66+i%> 38
    }
}
