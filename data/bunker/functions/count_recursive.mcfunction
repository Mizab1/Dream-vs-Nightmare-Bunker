#built using mc-build (https://github.com/mc-build/mc-build)

execute store result score %count value run data get storage temp Items[-1]
scoreboard players operation %total value += %count value
scoreboard players remove %length value 1
data remove storage temp Items[-1]
execute if score %length value matches 1.. run function bunker:count_recursive