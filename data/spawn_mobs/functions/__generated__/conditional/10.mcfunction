#built using mc-build (https://github.com/mc-build/mc-build)

summon ravager -40 67 146 {Team:"enemy",DeathLootTable:"minecraft:bat",PersistenceRequired:1b,Health:20f,Tags:["enemy","ravager","can_break"],CustomName:'{"text":"Nightmare Beast"}',Attributes:[{Name:generic.max_health,Base:20},{Name:generic.attack_damage,Base:4}]}
scoreboard players set #execute LANG_MC_INTERNAL 1