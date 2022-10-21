#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players set @s ff_rc 0
scoreboard players set triggered_magnetic_dev private 1
tellraw @s {"text":"Throw this device on the ground now!", "color":"red"}
schedule function bunker:__generated__/schedule/7 10s append