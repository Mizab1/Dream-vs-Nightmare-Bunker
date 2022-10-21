#built using mc-build (https://github.com/mc-build/mc-build)

summon creeper ~ ~ ~ {ExplosionRadius:6b,Fuse:1,ignited:1b}
particle campfire_signal_smoke ~ ~ ~ 1 1 1 1 300 normal
particle dust 0.678 0.659 0.102 3 ~ ~ ~ 3 3 3 1 300 normal
kill @e[tag=enemy, distance=..22]
kill @s