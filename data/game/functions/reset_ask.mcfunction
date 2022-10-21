#built using mc-build (https://github.com/mc-build/mc-build)

tellraw @p {"text": "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @p [{"text":"Your points will also be reset! Are you sure You want to reset it","color":"red"},{"text":"\n\n[Yes]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function game:yes"}},{"text":" [No]","color":"light_purple","clickEvent":{"action":"run_command","value":"/function game:no"}}]