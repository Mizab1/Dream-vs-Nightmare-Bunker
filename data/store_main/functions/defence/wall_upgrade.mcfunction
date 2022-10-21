#built using mc-build (https://github.com/mc-build/mc-build)

execute if score wall_upgrade private matches 0 run function store_main:defence/stone_wall
execute if score wall_upgrade private matches 1 run function store_main:defence/iron_wall
execute if score wall_upgrade private matches 2 run function store_main:defence/diamond_wall