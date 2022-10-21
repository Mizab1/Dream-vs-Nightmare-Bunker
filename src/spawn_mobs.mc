import ./macros/rngV2.mcm
import ./macros/mob_spawn.mcm

function spawn{

    scoreboard players set rng rng_score 0

    # Check the round and set the difficulty
    # Predifined waves
    # scoreboard players operation wave_type private = Wave: stats
    # scoreboard players operation wave_type private %= wave_mod private
    # execute(if score wave_type private matches 0){
    #     iron_golem -40 68 152
    # }else 

    execute(if score Wave: stats matches 0..2){
        rng range 1 5 rng rng_score
        tier_1 -40 67 146
    }else execute(if score Wave: stats matches 3..){
        rng range 1 18 rng rng_score
        tier_2 -40 67 146
    }
    
    scoreboard players remove mobsLeft mobs 1
    execute if score mobsLeft mobs matches 1.. run function spawn_mobs:spawn


    block{
        name steam_particles
        particle dust 1.000 1.000 1.000 3 -40 69 149 1 0.3 1 1 200 force
        particle flame -40 69 149 0.3 0.3 0.3 0.3 200 force
        particle dust 1.000 1.000 1.000 3 -40 69 149 0 1 0 0 100 force
    }
    execute at @e[type=zombie_villager, tag=enemy] run particle falling_dust lime_concrete ~ ~1.5 ~ 0.5 0.5 0.5 0.2 100 normal
        
    # execute(if score $switch custom_wave matches 0){
    # }else execute(if score $switch custom_wave matches 1..){
    #     scoreboard players remove cw_mobs_main mobs 1
    #     execute if score cw_mobs_main mobs matches 1.. run function spawn_mobs:spawn
    #     # scoreboard players set rng rng_score 0

    #     # Spawn the mobs when they're selected
    #     # Dummy sign: give @p warped_sign{BlockEntityTag:{Text1:'[{"text":"[ ","color":"gray","bold":true},{"text":"Mobs ","color":"blue","bold":true},{"text":"]","color":"gray","bold":true}]',Text3:'{"text":"Underwater","color":"gold"}',Text4:'{"text":"Zombie","color":"gold"}'}} 1
    #     execute(if score normal_zombie mobs matches 1..){
    #         macro dream -40 69 150
    #     }
    #     execute(if score miner_zombie mobs matches 1..){
    #         macro bionic -40 69 150
    #     }
    #     execute(if score builder_zombie mobs matches 1..){
    #         macro technoblade -40 69 150
    #     }
    #     execute(if score magma_zombie mobs matches 1..){
    #         macro mr_beast -40 69 150
    #     }
    #     execute(if score fast_zombie mobs matches 1..){
    #         macro preston -40 69 150
    #     }
    #     execute(if score strong_zombie mobs matches 1..){
    #         macro jelly -40 69 150
    #     }
    #     execute(if score brute_zombie mobs matches 1..){
    #         macro slogo -40 69 150
    #     }
    #     execute(if score end_zombie mobs matches 1..){
    #         macro crainer -40 69 150
    #     }
    #     execute(if score witch_zombie mobs matches 1..){
    #         macro aswd -40 69 150
    #     }
        # execute(if score skeleton mobs matches 1..){
        #     macro small_ufo -40 69 150
        #     macro small_ufo -40 69 150
        #     macro small_ufo -40 69 150
        #     macro small_ufo -40 69 150
        # }
        # execute(if score creeper mobs matches 1..){
        #     macro ufo -40 69 150
        #     macro ufo -40 69 150
        #     macro ufo -40 69 150
        #     macro ufo -40 69 150
        # }
        # execute(if score pillager mobs matches 1..){
        #     macro ravager -40 69 150
        #     macro ravager -40 69 150
        #     macro ravager -40 69 150
        #     macro ravager -40 69 150
        # }
    # }
}

# function mob_test{
#     macro corrupted_alex -27 68 137
#     macro herobrine -27 68 137
#     macro entity_303 -27 68 137
#     macro lost_miner -27 68 137
#     macro kill_bot -27 68 137
#     macro notchobrine -27 68 137
#     macro clown -27 68 137
#     macro banshee -27 68 137
#     macro ghost_villager -27 68 137
#     macro angry_creeper -27 68 137
# }

dir counter{
    function increase{
        # give @p warped_sign{BlockEntityTag:{Text1:'[{"text":"[ ","color":"gray","bold":true},{"text":"Increase","color":"gold"},{"text":" ]"}]',Text3:'{"text":"+ Mobs","color":"blue","clickEvent":{"action":"run_command","value":"/function spawn_mobs:counter/increase"}}'}} 1
        scoreboard players add cw_mobs mobs 100
        scoreboard players add cw_mobs_pro mobs 100


        # Update the main sign
        setblock -32 59 92 air
        setblock -32 59 92 minecraft:warped_wall_sign[facing=west]{Text2:'[{"text":"[ ","color":"gray","bold":true},{"text":"Counter","color":"green"},{"text":" ]"}]',Text4:'{"score":{"name":"cw_mobs_pro","objective":"mobs"},"color":"dark_green","bold":true}'} replace

        # Sound and stuff
        playsound minecraft:block.dispenser.dispense master @a -32 59 92 4 1.2
    }

    function decrease{
        # give @p warped_sign{BlockEntityTag:{Text1:'[{"text":"[ ","color":"gray","bold":true},{"text":"Decrease","color":"gold"},{"text":" ]"}]',Text3:'{"text":"- Mobs","color":"red","clickEvent":{"action":"run_command","value":"/function spawn_mobs:counter/decrease"}}'}} 1
        execute(if score cw_mobs mobs > cw_mobs_min mobs){

            scoreboard players remove cw_mobs mobs 100
            scoreboard players remove cw_mobs_pro mobs 100

            # Update the main sign
            setblock -32 59 92 air
            setblock -32 59 92 minecraft:warped_wall_sign[facing=west]{Text2:'[{"text":"[ ","color":"gray","bold":true},{"text":"Counter","color":"green"},{"text":" ]"}]',Text4:'{"score":{"name":"cw_mobs_pro","objective":"mobs"},"color":"dark_green","bold":true}'} replace

            # Sound and stuff
            playsound minecraft:block.dispenser.dispense master @a -32 59 92 1 1.4
        }
    }

}

dir sel{
    function normal_zombie{
        scoreboard players set normal_zombie mobs 1
        # scoreboard players add cw_mobs_sel mobs 1
    }

    function miner_zombie{
        scoreboard players set miner_zombie mobs 1
        # scoreboard players add cw_mobs_sel mobs 1
    }

    function builder_zombie{
        scoreboard players set builder_zombie mobs 1
        # scoreboard players add cw_mobs_sel mobs 1
    }

    function magma_zombie{
        scoreboard players set magma_zombie mobs 1
        # scoreboard players add cw_mobs_sel mobs 1
    }

    function fast_zombie{
        scoreboard players set fast_zombie mobs 1
        # scoreboard players add cw_mobs_sel mobs 1
    }

    function strong_zombie{
        scoreboard players set strong_zombie mobs 1
        # scoreboard players add cw_mobs_sel mobs 1
    }

    function brute_zombie{
        scoreboard players set brute_zombie mobs 1
        # scoreboard players add cw_mobs_sel mobs 1
    }

    function end_zombie{
        scoreboard players set end_zombie mobs 1
        # scoreboard players add cw_mobs_sel mobs 1
    }

    function witch_zombie{
        scoreboard players set witch_zombie mobs 1
        # scoreboard players add cw_mobs_sel mobs 1
    }

    function skeleton{
        scoreboard players set skeleton mobs 1
        # scoreboard players add cw_mobs_sel mobs 1
    }

    function creeper{
        scoreboard players set creeper mobs 1
        # scoreboard players add cw_mobs_sel mobs 1
    }

    function pillager{
        scoreboard players set pillager mobs 1
        # scoreboard players add cw_mobs_sel mobs 1
    }

    function king_zombie{
        scoreboard players set king_zombie mobs 1
        # scoreboard players add cw_mobs_sel mobs 1
    }

    function yeti{
        scoreboard players set yeti mobs 1
        # scoreboard players add cw_mobs_sel mobs 1
    }

    function arctic_creeper{
        scoreboard players set arctic_creeper mobs 1
        # scoreboard players add cw_mobs_sel mobs 1
    }

    function pharoah{
        scoreboard players set pharoah mobs 1
        # scoreboard players add cw_mobs_sel mobs 1
    }
}

dir sel_inverted{
    function normal_zombie{
        scoreboard players set normal_zombie mobs 0
        # scoreboard players remove cw_mobs_sel mobs 1
    }

    function miner_zombie{
        scoreboard players set miner_zombie mobs 0
        # scoreboard players remove cw_mobs_sel mobs 1
    }

    function builder_zombie{
        scoreboard players set builder_zombie mobs 0
        # scoreboard players remove cw_mobs_sel mobs 1
    }

    function magma_zombie{
        scoreboard players set magma_zombie mobs 0
        # scoreboard players remove cw_mobs_sel mobs 1
    }

    function fast_zombie{
        scoreboard players set fast_zombie mobs 0
        # scoreboard players remove cw_mobs_sel mobs 1
    }

    function strong_zombie{
        scoreboard players set strong_zombie mobs 0
        # scoreboard players remove cw_mobs_sel mobs 1
    }

    function brute_zombie{
        scoreboard players set brute_zombie mobs 0
        # scoreboard players remove cw_mobs_sel mobs 1
    }

    function end_zombie{
        scoreboard players set end_zombie mobs 0
        # scoreboard players remove cw_mobs_sel mobs 1
    }

    function witch_zombie{
        scoreboard players set witch_zombie mobs 0
        # scoreboard players remove cw_mobs_sel mobs 1
    }

    function skeleton{
        scoreboard players set skeleton mobs 0
        # scoreboard players remove cw_mobs_sel mobs 1
    }

    function creeper{
        scoreboard players set creeper mobs 0
        # scoreboard players remove cw_mobs_sel mobs 1
    }

    function pillager{
        scoreboard players set pillager mobs 0
        # scoreboard players remove cw_mobs_sel mobs 1
    }

    function king_zombie{
        scoreboard players set king_zombie mobs 0
        # scoreboard players remove cw_mobs_sel mobs 1
    }

    function yeti{
        scoreboard players set yeti mobs 0
        # scoreboard players remove cw_mobs_sel mobs 1
    }

    function arctic_creeper{
        scoreboard players set arctic_creeper mobs 0
        # scoreboard players remove cw_mobs_sel mobs 1
    }

    function pharoah{
        scoreboard players set pharoah mobs 0
        # scoreboard players remove cw_mobs_sel mobs 1
    }
}