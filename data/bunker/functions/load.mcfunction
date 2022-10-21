#built using mc-build (https://github.com/mc-build/mc-build)

time set midnight
gamerule mobGriefing false
gamerule sendCommandFeedback false
gamerule keepInventory true
gamerule doFireTick false
gamerule fireDamage false
gamerule universalAnger true
gamerule forgiveDeadPlayers false
gamerule doMobLoot false
scoreboard objectives add LANG_MC_INTERNAL dummy
scoreboard objectives add ff_rc used:carrot_on_a_stick
scoreboard objectives add death deathCount
scoreboard objectives add private dummy
scoreboard objectives add mobs dummy
scoreboard objectives add rng_score dummy
scoreboard objectives add point dummy {"text": "Points","color": "gold"}
scoreboard objectives setdisplay list point
scoreboard objectives add stats dummy {"text": "STATS","color": "green"}
scoreboard objectives setdisplay sidebar stats
scoreboard objectives add custom_wave dummy
scoreboard objectives add capture_time dummy
scoreboard objectives add stripper_charge dummy
scoreboard players set weapon_c private 1
scoreboard players set armor_c private 1
scoreboard players set defence_c private 1
scoreboard players set potion_c private 1
scoreboard players set weapon_min private 1
scoreboard players set armor_min private 1
scoreboard players set defence_min private 1
scoreboard players set potion_min private 1
scoreboard players set start private 0
scoreboard players set wave private 0
scoreboard players set wave_type private 0
scoreboard players set wave_mod private 5
scoreboard players set cannon_av private 1
scoreboard players set @a point 20
scoreboard players set cw_mobs_min mobs 0
scoreboard players set cw_mobs_main mobs 0
scoreboard players set cw_mobs mobs 0
scoreboard players set cw_mobs_pro mobs 0
scoreboard players set wall_upgrade private 0
setblock -32 59 92 air
setblock -32 59 92 minecraft:warped_wall_sign[facing=west]{Text2:'[{"text":"[ ","color":"gray","bold":true},{"text":"Counter","color":"green"},{"text":" ]"}]',Text4:'{"score":{"name":"cw_mobs_pro","objective":"mobs"},"color":"dark_green","bold":true}'} replace
team add red
team modify red color red
team join red Mobs:
team add main
team add enemy
team modify main collisionRule never
team modify main friendlyFire false
scoreboard players set weapon_max private 15
scoreboard players set armor_max private 4
scoreboard players set defence_max private 22
scoreboard players set potion_max private 5
scoreboard players set triggered_magnetic_dev private 0
scoreboard objectives add spike_used dummy
scoreboard objectives add ufo_abduction dummy
scoreboard objectives add value dummy