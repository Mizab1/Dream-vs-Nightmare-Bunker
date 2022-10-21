#built using mc-build (https://github.com/mc-build/mc-build)

summon creeper -40 67 146 {DeathLootTable:"minecraft:bat",Team:"enemy",PersistenceRequired:1b,Tags:["enemy","detect_explosion"],Passengers:[{id:"minecraft:zombie",DeathLootTable:"minecraft:bat",Team:"enemy",Tags:["pass"],ActiveEffects:[{Id:14,Amplifier:1b,Duration:999999,ShowParticles:0b}]}],CustomName:'{"text":"Nightmare Creeper","color":"green"}',ActiveEffects:[{Id:15,Amplifier:1b,Duration:999999,ShowParticles:0b}]}
scoreboard players set #execute LANG_MC_INTERNAL 1